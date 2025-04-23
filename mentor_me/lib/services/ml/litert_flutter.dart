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
  Future<int> runSummarizationStep({
    required String assetPath,
    required List<List<double>> inputs,
    required List<List<int>> inputShapes,
  }) async {
    final next = await _channel.invokeMethod<int>(
      'runSummarizationStep',
      {
        'assetPath': assetPath,
        'inputs': inputs,
        'inputShapes': inputShapes,
      },
    );
    return next!;
  }
}
