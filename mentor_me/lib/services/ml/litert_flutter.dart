import 'package:flutter/services.dart';

class LiteRtFlutter {
  static const _channel = MethodChannel('litert_flutter');

  Future<void> initialize() async {
    await _channel.invokeMethod('initialize');
  }

  /// Now takes the assetPath so the plugin can key its interpreters map.
  Future<void> loadModel(String assetPath) async {
    await _channel.invokeMethod('loadModel', { 'assetPath': assetPath });
  }

  /// Pass the same assetPath here.
  Future<List<double>> runInference({
    required String assetPath,
    required List<double> input,
    required List<int> inShape,
    required List<int> outShape,
  }) async {
    final result = await _channel.invokeMethod<List<dynamic>>(
      'runInference',
      {
        'assetPath': assetPath,
        'input': input,
        'inShape': inShape,
        'outShape': outShape,
      },
    );
    return result!.cast<double>();
  }
}
