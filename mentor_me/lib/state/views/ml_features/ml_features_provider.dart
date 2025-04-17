import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/services/ml/local_ocr_model_service.dart';
import 'package:mentor_me/services/ml/local_summarizer_model_service.dart';
import 'package:mentor_me/state/views/ml_features/ml_features_state.dart';

/// Provide a single instance for the entire app, or scoping as you see fit.
final mlFeaturesProvider = StateNotifierProvider<MlFeaturesNotifier, MlFeaturesState>((ref) {
  return MlFeaturesNotifier(LocalOcrModelService(), LocalSummarizerModelService());
});

/// The Riverpod state notifier that loads the TFLite models and runs inference.
class MlFeaturesNotifier extends StateNotifier<MlFeaturesState> {
  final LocalOcrModelService _ocrService;
  final LocalSummarizerModelService _summarizerService;
  final AppLogger _logger;

  MlFeaturesNotifier(this._ocrService, this._summarizerService)
      : _logger = AppLogger(),
        super(MlFeaturesState());

  Future<void> loadAllModels() async {
    try {
      await _ocrService.loadModel();
      _logger.logInfo("OCR model loaded!");
      await _summarizerService.loadModel();
      _logger.logInfo("Summarizer model loaded!");
    } catch (e) {
      _logger.logError("Error loading local models: $e");
      state = state.copyWith(errorMessage: 'Error loading local models');
    }
  }

  Future<void> runLocalOcr(File? imageFile) async {
    if (imageFile == null) {
      state = state.copyWith(errorMessage: 'No image selected!');
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: '', ocrText: []);
    try {
      final lines = await _ocrService.extractHandwrittenText(imageFile);
      state = state.copyWith(ocrText: lines, isLoading: false);
    } catch (e) {
      _logger.logError("Error running OCR: $e");
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> runLocalSummarize(String manualText) async {
    if (manualText.trim().isEmpty) {
      state = state.copyWith(errorMessage: 'Enter text to summarize.');
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: '', summaryText: '');
    try {
      final summary = await _summarizerService.chunkAndSummarize(manualText);
      state = state.copyWith(summaryText: summary, isLoading: false);
    } catch (e) {
      _logger.logError("Error summarizing text: $e");
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> runLocalOcrAndSummarize(File? imageFile) async {
    if (imageFile == null) {
      state = state.copyWith(errorMessage: 'No image selected!');
      return;
    }
    state = state.copyWith(
      isLoading: true,
      errorMessage: '',
      combinedText: '',
      ocrText: [],
      summaryText: '',
    );
    try {
      // 1) OCR
      final lines = await _ocrService.extractHandwrittenText(imageFile);
      final combinedText = lines.join(' ');
      // 2) Summarize
      final summary = await _summarizerService.chunkAndSummarize(combinedText);
      // Save to state
      state = state.copyWith(isLoading: false, combinedText: summary);
    } catch (e) {
      _logger.logError("Error in local OCR+Summarize: $e");
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  void resetLocalOutputs() {
    state = state.copyWith(
      ocrText: [],
      summaryText: '',
      combinedText: '',
      errorMessage: '',
    );
  }
}
