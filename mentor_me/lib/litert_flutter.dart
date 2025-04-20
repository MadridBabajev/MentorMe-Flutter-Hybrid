import 'package:flutter/services.dart';

class LiteRtFlutter {
  static const _channel = MethodChannel('litert_flutter');

  /// Must be called once, before any other calls.
  Future<void> initialize() async {
    await _channel.invokeMethod('initialize');
  }

  /// Load your TFLite file from assets.
  Future<void> loadModel(String assetPath) async {
    await _channel.invokeMethod('loadModel', {'assetPath': assetPath});
  }

  /// Run a single inference.
  /// - `input`: flattened list of doubles.
  /// - `inShape`: shape of input tensor.
  /// - `outShape`: shape of output tensor.
  /// Returns a flattened list of doubles.
  Future<List<double>> runInference({
    required List<double> input,
    required List<int> inShape,
    required List<int> outShape,
  }) async {
    final result = await _channel.invokeMethod<List<dynamic>>(
      'runInference',
      {
        'input': input,
        'inShape': inShape,
        'outShape': outShape,
      },
    );
    return result!.cast<double>();
  }
}
