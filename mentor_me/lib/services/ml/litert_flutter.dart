import 'package:flutter/services.dart';

class LiteRtFlutter {
  static const _channel = MethodChannel('litert_flutter');

  Future<void> initialize() async => await _channel.invokeMethod('initialize');

  Future<void> loadModel(String assetPath) async => await _channel.invokeMethod('loadModel', {'assetPath': assetPath});

  Future<List<double>> runOcrInference({
    required String assetPath,
    required List<double> input,
    required List<int> inShape,
    required List<int> outShape,
  }) async {
    final result = await _channel.invokeMethod<List<dynamic>>(
      'runOcrInference',
      {
        'assetPath': assetPath,
        'input': input,
        'inShape': inShape,
        'outShape': outShape,
      },
    );
    return result!.cast<double>();
  }

  Future<List<int>> getInputShape(String assetPath, int tensorIndex) async {
    final shape = await _channel.invokeMethod<List<dynamic>>(
      'getInputShape',
      {
        'assetPath': assetPath,
        'tensorIndex': tensorIndex,
      },
    );
    return shape!.cast<int>();
  }

  Future<List<int>> getOutputShape(String assetPath, int tensorIndex) async {
    final shape = await _channel.invokeMethod<List<dynamic>>(
      'getOutputShape',
      {
        'assetPath': assetPath,
        'tensorIndex': tensorIndex,
      },
    );
    return shape!.cast<int>();
  }

  /// Run one decoding step and get only the next token ID.
  /// Run the full decoder in one shot: returns a flat list of logits [decLen * vocabSize].
  Future<List<dynamic>> runSummarize({
    required String assetPath,
    required List<int> inputsIds,
    required List<int> attentionMask,
    required int maxNewTokens,
    required int padTokenId,
    required int eosTokenId,
  }) async {
    return await _channel.invokeMethod<List<dynamic>>(
      'runSummarize',
      {
        'assetPath': assetPath,
        'inputIds': inputsIds,
        'attentionMask': attentionMask,
        'maxNewTokens': maxNewTokens,
        'padTokenId': padTokenId,
        'eosTokenId': eosTokenId,
      },
    ) as List<dynamic>;
  }
}
