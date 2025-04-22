import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/services/ml/litert_flutter.dart';

class LocalSummarizerModelService {
  final LiteRtFlutter _liteRt = LiteRtFlutter();
  final JavascriptRuntime _js = getJavascriptRuntime();

  static const _modelPath    = 'assets/ml_models/summarization/summarization_model.tflite';
  static const _transformerJsBundlePath = 'assets/js/transformers.bundle.js';
  static const _tokenizerJsonPath        = 'assets/ml_models/summarization/tokenizer/tokenizer.json';

  bool _isLoaded = false;
  bool _isRunning = false;

  bool get isModelLoaded    => _isLoaded;
  bool get isRunningInference => _isRunning;

  Future<void> loadModel() async {
    if (_isLoaded) return;

    // — TFLite init unchanged —
    await _liteRt.initialize();
    await _liteRt.loadModel(_modelPath);

    // — JS runtime debug (optional) —
    JavascriptRuntime.debugEnabled = true;

    // Register channel BEFORE overriding console:
    _js.onMessage('dart_console', (dynamic raw) {
      final parts = raw as List<dynamic>;
      final level = parts.first as String;
      final message = parts.sublist(1)
          .map((p) => p is String ? p : jsonEncode(p))
          .join(' ');
      AppLogger().logInfo('[JS $level] $message');
    });
    // Check whether logs are working
    _js.evaluate('console.log("Hello from JS!", { foo: 123 });');

    // 2) Override `console` to use your channel:
    final bundle = await rootBundle.loadString(_transformerJsBundlePath);
    await _js.evaluateAsync('''
      // Evaluate the bundle inside a function and return its `transformers` export:
      globalThis.transformers = (function() {
        $bundle
        return transformers;
      })();
      console.log(JSON.stringify(globalThis.transformers));
    ''');
    final keysRes = await _js.evaluateAsync('JSON.stringify(Object.keys(globalThis.transformers))');
    if (keysRes.isError) {
      AppLogger().logError('Failed to list transformers keys: ${keysRes.stringResult}');
      return;
    } else {
      final List<dynamic> keys = keysRes.rawResult;
      AppLogger().logInfo('🔑 transformers exports: ${keys.join(', ')}');
    }

    // 5) Tokenizer init (unchanged) …
    final tokenizerJsonStr = await rootBundle.loadString(_tokenizerJsonPath);
    final initRes = _js.evaluate('''
      (() => {
        try {
          globalThis.tokenizer = new transformers.T5Tokenizer(
            ${jsonEncode(jsonDecode(tokenizerJsonStr))},
            { type: "t5" }
          );
          return 'OK';
        } catch (e) {
          return 'ERR:' + e.toString();
        }
      })()
    ''');

    if (!(initRes.stringResult?.startsWith('OK') ?? false)) {
      throw StateError('JS tokenizer init failed: ${initRes.stringResult}');
    }

    _isLoaded = true;
  }

  /// Summarize a single text chunk with greedy decoding.
  Future<String> summarizeText(
    String text, {
    int maxInputTokens = 512,
    int maxNewTokens = 50,
  }) async {
    if (!_isLoaded) throw StateError('Call loadModel() before inference.');

    _isRunning = true;
    try {
      // 1) Prefix + JS tokenize
      final prompt = 'summarize: $text';
      final check = await _js.evaluateAsync('typeof tokenizer.encode');
      AppLogger().logInfo(check.rawResult);
      if (check.rawResult != 'function') {
        throw StateError(
            'tokenizer.encode is not a function, got: ${check.rawResult}');
      }
      final encRes =
          await _js.evaluateAsync('tokenizer.encode(${jsonEncode(prompt)})');
      final List<dynamic> inIdsDyn = encRes.rawResult;
      var inputIds = List<int>.from(inIdsDyn);
      if (inputIds.length > maxInputTokens) {
        inputIds = inputIds.sublist(0, maxInputTokens);
      }
      final attentionMask = List.filled(inputIds.length, 1);

      // 2) Greedy decode loop
      //  T5 uses pad_token_id as decoder start
      final padRes = await _js.evaluateAsync('tokenizer.pad_token_id');
      final eosRes = await _js.evaluateAsync('tokenizer.eos_token_id');
      final padId = padRes.rawResult as int;
      final eosId = eosRes.rawResult as int;

      var outputIds = <int>[padId];
      final vocabSize =
          (await _js.evaluateAsync('tokenizer.vocab_size')).rawResult as int;

      for (var step = 0; step < maxNewTokens; step++) {
        // flatten inputs
        final flatInput = <double>[
          ...inputIds.map((i) => i.toDouble()),
          ...attentionMask.map((i) => i.toDouble()),
          ...outputIds.map((i) => i.toDouble()),
        ];
        final inShape = [1, flatInput.length];
        final outShape = [1, 1, vocabSize];

        // run TFLite inference
        final logits = await _liteRt.runInference(
          assetPath: _modelPath,
          input: flatInput,
          inShape: inShape,
          outShape: outShape,
        );

        // pick highest-prob from last step
        final start = (outputIds.length - 1) * vocabSize;
        final slice = logits.sublist(start, start + vocabSize);

        var maxVal = double.negativeInfinity;
        var nextToken = 0;
        for (var i = 0; i < slice.length; i++) {
          if (slice[i] > maxVal) {
            maxVal = slice[i];
            nextToken = i;
          }
        }
        if (nextToken == eosId) break;
        outputIds.add(nextToken);
      }

      // 3) Decode back to string via JS
      final decJson = jsonEncode(outputIds);
      final decRes = await _js.evaluateAsync('tokenizer.decode($decJson)');
      return decRes.stringResult ?? '';
    } finally {
      _isRunning = false;
    }
  }

  /// If your text is very long, chunk & re‑summarize
  Future<String> chunkAndSummarize(
    String text, {
    int maxInputTokens = 256,
    int summaryTokens = 50,
  }) async {
    if (!_isLoaded) throw StateError('Call loadModel() first.');
    final encodeRes =
        await _js.evaluateAsync('tokenizer.encode(${jsonEncode(text)})');
    final List<dynamic> fullIdsDyn = encodeRes.rawResult;
    final fullIds = List<int>.from(fullIdsDyn);

    final parts = <String>[];
    for (var i = 0; i < fullIds.length; i += maxInputTokens) {
      final sub =
          fullIds.sublist(i, (i + maxInputTokens).clamp(0, fullIds.length));
      // decode sub‑ids back to a string chunk
      final chunkTextRes =
          await _js.evaluateAsync('tokenizer.decode(${jsonEncode(sub)})');
      final chunkText = chunkTextRes.stringResult ?? '';
      parts.add(await summarizeText(
        chunkText,
        maxInputTokens: maxInputTokens,
        maxNewTokens: summaryTokens,
      ));
    }
    // final merge
    return summarizeText(
      parts.join(' '),
      maxInputTokens: maxInputTokens,
      maxNewTokens: summaryTokens,
    );
  }
}
