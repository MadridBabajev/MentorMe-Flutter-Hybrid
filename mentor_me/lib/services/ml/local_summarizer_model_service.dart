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
        int maxInputTokens = 512,
        int maxNewTokens = 50,
      }) async {
    if (!_isLoaded) throw StateError('Call loadModel() first.');

    // 1) Prefix
    final prompt = 'summarize: $inputText';
    AppLogger().logInfo(prompt);

    // 2) Tokenize
    final encResp = await _dio.post(
      '/encode',
      data: {'text': prompt, 'max_length': maxInputTokens},
    );
    List<int> inputIds = (encResp.data['input_ids'] as List<dynamic>).cast<int>();
    List<int> attentionMask = (encResp.data['attention_mask'] as List<dynamic>).cast<int>();

    AppLogger().logInfo('encode → inputIds.length=${inputIds.length}, attentionMask.length=${attentionMask.length}');
    // 3) Discover TFLite’s fixed input shapes
    final encShape =
    await _liteRt.getInputShape(_modelAssetPath, /*encoder_input_ids*/ 0);
    final maskShape =
    await _liteRt.getInputShape(_modelAssetPath, /*encoder_mask*/ 1);
    final decShape =
    await _liteRt.getInputShape(_modelAssetPath, /*decoder_input_ids*/ 2);

    final encLen = encShape.length > 1 ? encShape[1] : inputIds.length;
    final maskLen = maskShape.length > 1 ? maskShape[1] : attentionMask.length;
    final decLen = decShape.length > 1 ? decShape[1] : maxNewTokens + 1;

    AppLogger().logInfo('shapes → encLen=$encLen, maskLen=$maskLen, decLen=$decLen');

    const padTokenId = 0;
    const eosTokenId = 1;

    // 4) Pad/truncate encoder inputs
    if (inputIds.length > encLen) {
      inputIds = inputIds.sublist(0, encLen);
    } else if (inputIds.length < encLen) {
      inputIds = [
        ...inputIds,
        ...List.filled(encLen - inputIds.length, padTokenId)
      ];
    }
    if (attentionMask.length > maskLen) {
      attentionMask = attentionMask.sublist(0, maskLen);
    } else if (attentionMask.length < maskLen) {
      attentionMask = [
        ...attentionMask,
        ...List.filled(maskLen - attentionMask.length, 0)
      ];
    }

    // 5) Iterative greedy decode
    List<int> outputIds = [padTokenId];
    for (var step = 0; step < maxNewTokens; step++) {
      print("=== Step $step ===");
      // pad/truncate decoder inputs
      final decInputIds = outputIds.length > decLen
          ? outputIds.sublist(0, decLen)
          : [
        ...outputIds,
        ...List.filled(decLen - outputIds.length, padTokenId)
      ];

      print('decoderInputIds: (${decInputIds.length}); ${decInputIds.take(10).toList()}${decInputIds.length>10?"…":""}');

      // build inputs as doubles
      final inputs = [
        inputIds.map((e) => e.toDouble()).toList(),
        attentionMask.map((e) => e.toDouble()).toList(),
        decInputIds.map((e) => e.toDouble()).toList(),
      ];
      final shapes = [
        [1, encLen],
        [1, maskLen],
        [1, decLen],
      ];

      // fetch just the next token
      final nextToken = await _liteRt.runSummarizationStep(
        assetPath: _modelAssetPath,
        inputs: inputs,
        inputShapes: shapes,
      );
      print('nextToken = $nextToken');

      if (nextToken == eosTokenId) break;
      outputIds.add(nextToken);
    }

    // 6) Decode the final ids (skipping the initial pad)
    final decResp = await _dio.post('/decode', data: {
      'ids': outputIds.sublist(1),
      'skip_special_tokens': true,
    });
    AppLogger().logInfo('decode → returned text: "${decResp.data['text']}"');
    return decResp.data['text'] as String;
  }

  /// Chunk & summarize long texts exactly as in React.
  Future<String> chunkAndSummarize(
      String text, {
        int maxChunkTokens = 256,
        int summaryTokens = 50,
      }) async {
    if (!_isLoaded) throw StateError('Call loadModel() before inference.');
    AppLogger().logInfo('full text length = ${text.length}');
    // 1) Full encode
    final fullEnc = await _dio.post('/encode', data: {'text': text});
    final allIds = (fullEnc.data['input_ids'] as List<dynamic>).cast<int>();
    AppLogger().logInfo('total tokens = ${allIds.length}');

    // 2) Summarize each chunk
    final partials = <String>[];
    for (var i = 0; i < allIds.length; i += maxChunkTokens) {
      final end = (i + maxChunkTokens).clamp(0, allIds.length);
      final sliceIds = allIds.sublist(i, end);

      print('--- chunk for tokens [$i..$end) → length ${sliceIds.length} ---');
      // decode chunk back to text
      final chunkDec = await _dio.post(
        '/decode',
        data: {'ids': sliceIds, 'skip_special_tokens': true},
      );
      final chunkText = chunkDec.data['text'] as String;
      print('chunkText: "$chunkText"');

      final partialSummary = await summarizeText(
        chunkText,
        maxInputTokens: maxChunkTokens,
        maxNewTokens: summaryTokens,
      );
      print('partialSummary: "$partialSummary"');
      partials.add(partialSummary);
    }

    // 3) Merge & final summarize
    final merged = await summarizeText(
      partials.join(' '),
      maxInputTokens: maxChunkTokens,
      maxNewTokens: summaryTokens,
    );
    AppLogger().logInfo('Final merged summary: "$merged"');
    return merged;
  }
}
