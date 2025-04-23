import 'package:dio/dio.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/services/ml/litert_flutter.dart';

class LocalSummarizerModelService {
  final LiteRtFlutter _liteRt = LiteRtFlutter();
  final Dio _dio;

  bool _isLoaded = false;

  static const _tokenizerBaseUrl = 'http://192.168.1.108:3000';
  static const _modelAssetPath =
      'assets/ml_models/summarization/summarization_model.tflite';

  LocalSummarizerModelService({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: _tokenizerBaseUrl));

  bool get isModelLoaded => _isLoaded;

  Future<void> loadModel() async {
    if (_isLoaded) return;
    await _liteRt.initialize();
    await _liteRt.loadModel(_modelAssetPath);
    _isLoaded = true;
  }

  /// Summarize a single chunk of text with naive greedy decoding, matching React logic.
  Future<String> summarizeText(
      String inputText, {
        int maxInputTokens = 256,
        int maxNewTokens = 50,
      }) async {
    if (!_isLoaded) throw StateError('Call loadModel() first.');

    // 1) Prefix + tokenize
    final prompt = 'summarize: $inputText';
    final encResp = await _dio.post('/encode', data: { 'text': prompt });
    List<int> inputIds = List<int>.from(encResp.data['input_ids']);
    List<int> attentionMask = List<int>.from(encResp.data['attention_mask']);

    // 2) Get TFLite input shapes
    final encShape = await _liteRt.getInputShape(_modelAssetPath, 0);
    final maskShape = await _liteRt.getInputShape(_modelAssetPath, 1);
    final decShape = await _liteRt.getInputShape(_modelAssetPath, 2);
    final encLen = encShape.length > 1 ? encShape[1] : inputIds.length;
    final maskLen = maskShape.length > 1 ? maskShape[1] : attentionMask.length;
    final decoderLen = decShape.length > 1 ? decShape[1] : maxNewTokens + 1;

    const padTokenId = 0;
    const eosTokenId = 1;

    // 3) Pad/truncate encoder inputs
    if (inputIds.length > encLen) {
      inputIds = inputIds.sublist(0, encLen);
    } else if (inputIds.length < encLen) {
      inputIds = [
        ...inputIds,
        ...List.filled(encLen - inputIds.length, padTokenId),
      ];
    }
    if (attentionMask.length > maskLen) {
      attentionMask = attentionMask.sublist(0, maskLen);
    } else if (attentionMask.length < maskLen) {
      attentionMask = [
        ...attentionMask,
        ...List.filled(maskLen - attentionMask.length, 0),
      ];
    }

    // 4) Build the single-shot inputs & shapes
    final decInputIds = List<int>.filled(decoderLen, padTokenId);
    final List<List<double>> inputsList = [
      inputIds.map((e) => e.toDouble()).toList(),
      attentionMask.map((e) => e.toDouble()).toList(),
      decInputIds.map((e) => e.toDouble()).toList(),
    ];
    final List<List<int>> shapesList = [
      [1, encLen],
      [1, maskLen],
      [1, decoderLen],
    ];

    // 5) Iterative autoregressive decoding
    // Prepare constant encoder inputs as doubles
    final encInputD = inputIds.map((e) => e.toDouble()).toList();
    final attMaskD = attentionMask.map((e) => e.toDouble()).toList();

    // Decoder buffer, always length = decoderLen, initialized to all-pad
    final decBuffer = List<int>.filled(decoderLen, padTokenId);
    final List<int> generatedIds = [];

    for (var step = 0; step < maxNewTokens; step++) {
      // Build inputs for this step
      final decInputD = decBuffer.map((e) => e.toDouble()).toList();
      final inputsStep = <List<double>>[encInputD, attMaskD, decInputD];

      // Run the model once
      final flatLogits = await _liteRt.runFullSummarization(
        assetPath: _modelAssetPath,
        inputs: inputsStep,
        inputShapes: shapesList, // shapesList unchanged
      );

      // Determine vocab size from returned flat logits
      final vocabSize = flatLogits.length ~/ decoderLen;
      // Look only at this step’s slice of the logits
      final base = step * vocabSize;

      // Argmax over that slice
      var maxVal = double.negativeInfinity;
      var nextToken = padTokenId;
      for (var v = 0; v < vocabSize; v++) {
        final val = flatLogits[base + v];
        if (val > maxVal) {
          maxVal = val;
          nextToken = v;
        }
      }
      // Stop on EOS
      if (nextToken == eosTokenId) break;

      // Record and feed back
      generatedIds.add(nextToken);
      decBuffer[step + 1] = nextToken;
    }

    // 7) Decode via your tokenizer service
    final decResp = await _dio.post('/decode', data: {'ids': generatedIds});
    return decResp.data['text'] as String;
  }

  /// Chunk & summarize long texts exactly as in React.
  Future<String> chunkAndSummarize(
      String text, {
        int maxChunkTokens = 256,
        int summaryTokens = 50,
      }) async {
    if (!_isLoaded) throw StateError('Call loadModel() before inference.');
    print('full text length = ${text.length}');

    // 1) Full encode → total token count
    final fullEnc = await _dio.post('/encode', data: {'text': text});
    final allIds = (fullEnc.data['input_ids'] as List).cast<int>();
    print('total tokens = ${allIds.length}');

    // 2) Summarize each token-slice
    final partials = <String>[];
    for (var i = 0; i < allIds.length; i += maxChunkTokens) {
      final end = (i + maxChunkTokens).clamp(0, allIds.length);
      final sliceIds = allIds.sublist(i, end);

      // decode chunk back to text
      final chunkDec = await _dio.post('/decode', data: {'ids': sliceIds});
      final chunkText = chunkDec.data['text'] as String;
      print('chunkText: "$chunkText"');

      final partial = await summarizeText(
        chunkText,
        maxInputTokens: maxChunkTokens,
        maxNewTokens: summaryTokens,
      );
      print('partialSummary: "$partial"');
      partials.add(partial);
    }

    // 4) Otherwise merge them
    final merged = partials.join(' ');
    print('Final merged summary: "$merged"');
    return merged;
  }
}
