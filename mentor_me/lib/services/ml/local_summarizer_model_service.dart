import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/services.dart';
// import 'package:tokenizers/tokenizers.dart';
import 'package:mentor_me/litert_flutter.dart';

class LocalSummarizerModelService {
  final _liteRt = LiteRtFlutter();
  static const _summarizerAsset = 'assets/ml_models/summarization/summarization_model.tflite';
  // late final SentencePieceProcessor _sp;
  bool _isLoaded = false;
  bool _isRunning = false;

  /// Call once to init LiteRT & load model + tokenizer.
  Future<void> loadModel() async {
    if (_isLoaded) return;
    // 1) LiteRT init & model load
    await _liteRt.initialize();
    await _liteRt.loadModel(_summarizerAsset);
    //
    // // 2) load tokenizer JSON via `tokenizers` package
    // //    (that supports your T5 SentencePiece vocab + merges)
    // _sp = SentencePieceProcessor();
    // final spData = await rootBundle.load(spModelAssetPath);
    // _sp.loadFromBuffer(spData.buffer.asUint8List());

    _isLoaded = true;
  }

  bool get isModelLoaded => _isLoaded;
  bool get isRunningInference => _isRunning;

  /// Summarize a single chunk with greedy iterative decoding.
  // Future<String> summarizeText(
  //     String inputText, {
  //       int maxNewTokens = 50,
  //       int maxInputTokens = 512,
  //     }) async {
  //   if (!_isLoaded) {
  //     throw Exception('Summarization model not loaded. Call loadModel() first.');
  //   }
  //   _isRunning = true;
  //
  //   try {
  //     // 1) prefix & tokenize
  //     final prompt = 'summarize: $inputText';
  //     List<int> inputIds = _sp.encodeAsIds(prompt);
  //     if (inputIds.length > maxInputTokens) inputIds = inputIds.sublist(0, maxInputTokens);
  //     final List<int> attentionMask = List.filled(inputIds.length, 1);
  //
  //     // 2) prepare decoder start
  //     final padId = _sp.pieceToId('<pad>');
  //     final eosId = _sp.pieceToId('</s>');
  //     List<int> outputIds = [padId];
  //     final vocabSize = _sp.getPieceSize();
  //
  //     // 3) decode loop
  //     for (var step = 0; step < maxNewTokens; step++) {
  //       // flatten encIds + mask + decIds into one buffer
  //       final flatInput = <double>[
  //         ...inputIds.map((i) => i.toDouble()),
  //         ...attentionMask.map((i) => i.toDouble()),
  //         ...outputIds.map((i) => i.toDouble()),
  //       ];
  //
  //       // input shape: [1, totalLen]
  //       final List<int> inShape = <int>[1, flatInput.length];
  //
  //       // output shape: [1, 1, vocabSize]
  //       final List<int> outShape = <int>[1, 1, vocabSize];
  //
  //       final List<double> rawOut = await _liteRt.runInference(
  //         input: flatInput,
  //         inShape: inShape,
  //         outShape: outShape,
  //       );
  //
  //       // take the slice corresponding to the last decoder step
  //       final int start = (outputIds.length - 1) * vocabSize as int;
  //       final int end = start + vocabSize as int;
  //       final slice = rawOut.sublist(start, end);
  //
  //       // pick max index
  //       var maxVal = double.negativeInfinity;
  //       var maxIdx = 0;
  //       for (var i = 0; i < slice.length; i++) {
  //         if (slice[i] > maxVal) {
  //           maxVal = slice[i];
  //           maxIdx = i;
  //         }
  //       }
  //
  //       // stop on EOS
  //       if (maxIdx == eosId) break;
  //       outputIds.add(maxIdx);
  //     }
  //
  //     // 4) decode tokens → text (skip initial pad)
  //     return _sp.decodeIds(outputIds.sublist(1));
  //   } finally {
  //     _isRunning = false;
  //   }
  // }

  /// If input longer than maxInputTokens, chunk & re-summarize.
  // Future<String> chunkAndSummarize(
  //     String inputText, {
  //       int maxInputTokens = 256,
  //       int summaryTokens = 50,
  //     }) async {
  //   if (!_isLoaded) {
  //     throw Exception('Load model first.');
  //   }
  //   List<int> inputIds = _sp.encodeAsIds(inputText);
  //
  //   final parts = <String>[];
  //   for (var start = 0; start < inputIds.length; start += maxInputTokens) {
  //     final end = math.min(start + maxInputTokens, inputIds.length);
  //     final subIds = inputIds.sublist(start, end);
  //     final chunkText = _sp.decodeIds(subIds.sublist(1));
  //     parts.add(await summarizeText(
  //       chunkText,
  //       maxNewTokens: summaryTokens,
  //       maxInputTokens: maxInputTokens,
  //     ));
  //   }
  //   // final merge
  //   return summarizeText(
  //     parts.join(' '),
  //     maxNewTokens: summaryTokens,
  //     maxInputTokens: maxInputTokens,
  //   );
  // }
  Future<String> chunkAndSummarize(
      String inputText, {
        int maxInputTokens = 256,
        int summaryTokens = 50,
      }) async { throw Exception('Not implemented'); }
}
