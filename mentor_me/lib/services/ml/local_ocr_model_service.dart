import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:mentor_me/common/logger/logger.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

/// Simple bounding box class for line detection.
class RectBox {
  final int x;
  final int y;
  final int width;
  final int height;

  RectBox(this.x, this.y, this.width, this.height);
}

class LocalOcrModelService {
  late Interpreter _interpreter;
  bool _isModelLoaded = false;
  bool _isRunningInference = false;

  // Map your model's predicted integer IDs to characters
  final Map<int, String> _charMap = {
    1: ' ',  2: '!', 3: '"', 4: '#', 5: '&',
    6: '\'', 7: '(', 8: ')', 9: '*', 10: '+',
    11: ',', 12: '-', 13: '.', 14: '/', 15: '0',
    16: '1', 17: '2', 18: '3', 19: '4', 20: '5',
    21: '6', 22: '7', 23: '8', 24: '9', 25: ':',
    26: ';', 27: '?', 28: 'A', 29: 'B', 30: 'C',
    31: 'D', 32: 'E', 33: 'F', 34: 'G', 35: 'H',
    36: 'I', 37: 'J', 38: 'K', 39: 'L', 40: 'M',
    41: 'N', 42: 'O', 43: 'P', 44: 'Q', 45: 'R',
    46: 'S', 47: 'T', 48: 'U', 49: 'V', 50: 'W',
    51: 'X', 52: 'Y', 53: 'Z', 54: 'a', 55: 'b',
    56: 'c', 57: 'd', 58: 'e', 59: 'f', 60: 'g',
    61: 'h', 62: 'i', 63: 'j', 64: 'k', 65: 'l',
    66: 'm', 67: 'n', 68: 'o', 69: 'p', 70: 'q',
    71: 'r', 72: 's', 73: 't', 74: 'u', 75: 'v',
    76: 'w', 77: 'x', 78: 'y', 79: 'z', 80: ''
  };

  // Adjust if your model's blank token is a different index
  final int _blankIndex = 0;

  /// Loads the OCR model from assets if not already loaded.
  Future<void> loadModel({
    String modelAssetPath = 'assets/ml_models/ocr/ocr_model.tflite',
  }) async {
    if (_isModelLoaded) return;

    try {
      final options = InterpreterOptions();
      // options.addDelegate(FlexDelegate());
      _interpreter = await Interpreter.fromAsset(modelAssetPath, options: options);
      _interpreter.allocateTensors();

      _isModelLoaded = true;
    } catch (e) {
      rethrow;
    }
  }

  bool get isModelLoaded => _isModelLoaded;
  bool get isRunningInference => _isRunningInference;

  /// Accepts an image File, detects lines, runs inference on each line,
  /// and returns recognized text per line.
  Future<List<String>> extractHandwrittenText(File imageFile) async {
    if (!_isModelLoaded) throw Exception('OCR model is not loaded. Call loadModel() first.');
    _isRunningInference = true;

    try {
      // 1) Decode into an in-memory Image object from 'package:image'.
      final bytes = await imageFile.readAsBytes();
      final rawImage = img.decodeImage(bytes);
      if (rawImage == null) {
        throw Exception('Could not decode image.');
      }

      // 2) Detect lines (placeholder approach)
      final lineBoxes = _detectLinesPlaceholder(rawImage);

      // 3) For each bounding box, crop, resize, run inference, decode
      final results = <String>[];
      for (final box in lineBoxes) {
        // Crop region
        final cropped = img.copyCrop(rawImage, box.x, box.y, box.width, box.height);

        // Resize to 800 x 128 (width x height)
        final resized = img.copyResize(
          cropped,
          width: 800,
          height: 128,
        );

        // Convert to grayscale
        final grayscale = img.grayscale(resized);

        // Preprocess for model input
        final inputTensor = _buildInputTensor(grayscale);

        // Build output buffer
        final outputShape = _interpreter.getOutputTensor(0).shape;
        final outputBuffer = List.filled(
          outputShape[1] * outputShape[2],
          0.0,
        ).reshape([1, outputShape[1], outputShape[2]]);

        // Run inference
        _interpreter.run(inputTensor, outputBuffer);

        // Greedy decode
        final decoded = _ctcGreedyDecode(
          outputBuffer as List<List<List<double>>>,
          outputShape,
        );
        results.add(decoded);
      }

      return results;
    } finally {
      _isRunningInference = false;
    }
  }

  /// A placeholder line detector that scans horizontally for "dark" rows.
  /// Replace with your real morphological or contour-based approach if desired.
  List<RectBox> _detectLinesPlaceholder(img.Image image) {
    final down = img.copyResize(image, width: image.width, height: image.height ~/ 2);
    final width = down.width;
    final height = down.height;

    // 2) Build horizontal projection profile
    final List<int> rowInk = List.filled(height, 0);
    for (int y = 0; y < height; y++) {
      int ink = 0;
      for (int x = 0; x < width; x++) {
        final p = down.getPixel(x, y);
        final luma = (0.2126 * img.getRed(p) +
            0.7152 * img.getGreen(p) +
            0.0722 * img.getBlue(p)).round();
        // count “ink” pixels – tune threshold if needed
        if (luma < 200) ink++;
      }
      rowInk[y] = ink;
    }

    // 3) Threshold projection → contiguous bands = text lines
    const minInkPerRow = 0.03; // 3% of pixels are dark
    final lines = <RectBox>[];
    int? startY;
    for (int y = 0; y < height; y++) {
      final hasInk = rowInk[y] > minInkPerRow * width;
      if (hasInk && startY == null) startY = y;
      if (!hasInk && startY != null) {
        final h = y - startY;
        if (h > 10) { // filter tiny noise
          lines.add(RectBox(0, startY * 2, image.width, h * 2)); // *2 because of downsampling
        }
        startY = null;
      }
    }
    if (startY != null && height - startY > 10) {
      lines.add(RectBox(0, startY * 2, image.width, (height - startY) * 2));
    }

    // Sort top-to-bottom
    lines.sort((a, b) => a.y.compareTo(b.y));
    return lines;
  }

  /// Converts a 128x800 grayscale image into a Float32 4D array: [1, 128, 800, 1].
  /// Values are normalized to [0..1].
  List _buildInputTensor(img.Image grayscale) {
    final w = grayscale.width;
    final h = grayscale.height;

    // We'll store the pixel data in a 4D list:
    final inputShape  = _interpreter.getInputTensor(0).shape;   // [1,128,800,1]
    final input  = Float32List(inputShape.reduce((a,b)=>a*b))
        .reshape(inputShape);

    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        final pixel = grayscale.getPixel(x, y);
        final r = img.getRed(pixel); // grayscale => r=g=b
        final normalized = r / 255.0;
        input[0][y][x][0] = normalized;
      }
    }
    return input;
  }

  /// Greedy decode for a CTC output. We assume output shape of [1, T, vocabSize].
  String _ctcGreedyDecode(List<List<List<double>>> outputData, List<int> outputShape) {
    // For example, outputShape = [1, T, vocabSize].
    final timeSteps = outputShape[1];
    final vocabSize = outputShape[2];

    int prevToken = _blankIndex;
    final sb = StringBuffer();

    for (int t = 0; t < timeSteps; t++) {
      double maxVal = double.negativeInfinity;
      int argMax = 0;

      // Find the argmax at this time step
      for (int c = 0; c < vocabSize; c++) {
        final val = outputData[0][t][c];
        if (val > maxVal) {
          maxVal = val;
          argMax = c;
        }
      }

      // If argMax != blank && argMax != prevToken => emit
      if (argMax != _blankIndex && argMax != prevToken) {
        final ch = _charMap[argMax] ?? '';
        sb.write(ch);
      }
      prevToken = argMax;
    }
    return sb.toString();
  }
}
