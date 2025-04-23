import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:mentor_me/services/ml/litert_flutter.dart';

/// Simple bounding box for line detection.
class RectBox {
  final int x, y, width, height;
  RectBox(this.x, this.y, this.width, this.height);
}

class LocalOcrModelService {
  final _liteRt = LiteRtFlutter();
  static const _modelPath = 'assets/ml_models/ocr/ocr_model.tflite';
  bool _isLoaded = false;
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

  bool get isModelLoaded => _isLoaded;
  bool get isRunningInference => _isRunningInference;

  /// Initialize LiteRT runtime & load model from assets.
  Future<void> loadModel() async {
    if (_isLoaded) return;
    await _liteRt.initialize();
    await _liteRt.loadModel(_modelPath);
    _isLoaded = true;
  }

  /// Runs OCR: line‑detect → crop/resize → runInference → CTC decode
  Future<List<String>> extractHandwrittenText(File imageFile) async {
    if (!_isLoaded) throw StateError('OCR model not loaded. Call loadModel() first.');
    _isRunningInference = true;

    try {
      // 1) Decode image
      final bytes = await imageFile.readAsBytes();
      final raw = img.decodeImage(bytes);
      if (raw == null) throw Exception('Could not decode image.');

      // 2) Simple horizontal‑projection line detector
      final boxes = _detectLinesPlaceholder(raw);

      // 3) For each line: preprocess, run, decode
      final results = <String>[];
      for (final box in boxes) {
        final cropped = img.copyCrop(raw, box.x, box.y, box.width, box.height);

        // resize → 800×128, grayscale
        final resized = img.copyResize(cropped, width: 800, height: 128);
        final gray = img.grayscale(resized);

        // flatten into float list [1,128,800,1]
        final input = _buildInputList(gray);
        final inShape = [1, 128, 800, 1];

        // compute output shape: timeSteps = 800/16 = 50, vocabSize = charMap+blank
        final timeSteps = 800 ~/ 16;
        final vocabSize = _charMap.length + 1;
        final outShape = [1, timeSteps, vocabSize];

        // run inference via LiteRT
        final flatOut = await _liteRt.runOcrInference(
          assetPath: _modelPath,
          input: input,       // List<double>
          inShape: inShape,   // e.g. [1,128,800,1]
          outShape: outShape, // e.g. [1,50,vocabSize]
        );

        // reshape and decode
        final output3d = _reshapeFlatTo3D(flatOut, timeSteps, vocabSize);
        results.add(_ctcGreedyDecode(output3d, timeSteps, vocabSize));
      }

      return results;
    } finally {
      _isRunningInference = false;
    }
  }

  // Simple line detector (same as before) :contentReference[oaicite:0]{index=0}&#8203;:contentReference[oaicite:1]{index=1}
  List<RectBox> _detectLinesPlaceholder(img.Image image) {
    final down = img.copyResize(image,
        width: image.width, height: image.height ~/ 2);
    final w = down.width, h = down.height;
    final rowInk = List<int>.filled(h, 0);

    for (var y = 0; y < h; y++) {
      var ink = 0;
      for (var x = 0; x < w; x++) {
        final p = down.getPixel(x, y);
        final luma = (0.2126 * img.getRed(p) +
            0.7152 * img.getGreen(p) +
            0.0722 * img.getBlue(p))
            .round();
        if (luma < 200) ink++;
      }
      rowInk[y] = ink;
    }

    const minInkFrac = 0.03;
    final lines = <RectBox>[];
    int? startY;
    for (var y = 0; y < h; y++) {
      final hasInk = rowInk[y] > minInkFrac * w;
      if (hasInk && startY == null) startY = y;
      if (!hasInk && startY != null) {
        final height = y - startY;
        if (height > 10) {
          lines.add(RectBox(0, startY * 2, image.width, height * 2));
        }
        startY = null;
      }
    }
    if (startY != null && h - startY > 10) {
      lines.add(RectBox(0, startY * 2, image.width, (h - startY) * 2));
    }
    lines.sort((a, b) => a.y.compareTo(b.y));
    return lines;
  }

  // Build Float32List from grayscale 128×800 image
  List<double> _buildInputList(img.Image gray) {
    final list = <double>[];
    for (var y = 0; y < gray.height; y++) {
      for (var x = 0; x < gray.width; x++) {
        final pixel = gray.getPixel(x, y);
        list.add(img.getRed(pixel) / 255.0);
      }
    }
    return list;
  }

  // Reshape flat [1*T*V] → [1][T][V]
  List<List<List<double>>> _reshapeFlatTo3D(
      List<double> flat, int T, int V) {
    var offset = 0;
    final out = List.generate(
        1,
            (_) => List.generate(
            T, (_) => List<double>.filled(V, 0.0),
            growable: false),
        growable: false);
    for (var t = 0; t < T; t++) {
      for (var v = 0; v < V; v++) {
        out[0][t][v] = flat[offset++];
      }
    }
    return out;
  }

  // CTC greedy decode
  String _ctcGreedyDecode(
      List<List<List<double>>> data, int T, int V) {
    var prev = _blankIndex;
    final sb = StringBuffer();
    for (var t = 0; t < T; t++) {
      var maxVal = double.negativeInfinity;
      var argMax = 0;
      for (var v = 0; v < V; v++) {
        final val = data[0][t][v];
        if (val > maxVal) {
          maxVal = val;
          argMax = v;
        }
      }
      if (argMax != _blankIndex && argMax != prev) {
        sb.write(_charMap[argMax] ?? '');
      }
      prev = argMax;
    }
    return sb.toString();
  }
}
