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
    final encLen = encShape.length > 1 ? encShape[1] : inputIds.length;
    final maskLen = maskShape.length > 1 ? maskShape[1] : attentionMask.length;

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

    // 4) One native plugin call does all the greedy decoding:
    final generatedIds = await _liteRt.runSummarize(
      assetPath: _modelAssetPath,
      inputsIds: inputIds,
      attentionMask: attentionMask,
      maxNewTokens: maxNewTokens,
      padTokenId: padTokenId,
      eosTokenId: eosTokenId,
    );

    // 6) Decode token IDs back to text
    final decResp = await _dio.post('/decode', data: {'ids': generatedIds.cast<int>()},);
    return decResp.data['text'] as String;
  }

  /// Chunk & summarize long texts exactly as in React.
  Future<String> chunkAndSummarize(
      String text, {
        int maxChunkTokens = 256,
        int summaryTokens = 50,
      }) async {
    if (!_isLoaded) throw StateError('Call loadModel() before inference.');

    // 1) Full encode → total token count
    final fullEnc = await _dio.post('/encode', data: {'text': text});
    final allIds = (fullEnc.data['input_ids'] as List).cast<int>();

    // 2) Summarize each token-slice
    final partials = <String>[];
    for (var i = 0; i < allIds.length; i += maxChunkTokens) {
      final end = (i + maxChunkTokens).clamp(0, allIds.length);
      final sliceIds = allIds.sublist(i, end);

      // decode chunk back to text
      final chunkDec = await _dio.post('/decode', data: {'ids': sliceIds});
      final chunkText = chunkDec.data['text'] as String;

      final partial = await summarizeText(
        chunkText,
        maxInputTokens: maxChunkTokens,
        maxNewTokens: summaryTokens,
      );
      AppLogger().logInfo('partialSummary: "$partial"');
      partials.add(partial);
    }

    // 4) Otherwise merge them
    final merged = partials.join(' ');
    AppLogger().logInfo('Final merged summary: "$merged"');
    return merged;
  }
}
