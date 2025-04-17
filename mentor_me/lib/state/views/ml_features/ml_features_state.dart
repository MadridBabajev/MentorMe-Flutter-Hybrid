/// State class to hold the results of local inference.
class MlFeaturesState {
  final bool isLoading;
  final List<String> ocrText;
  final String summaryText;
  final String combinedText;
  final String errorMessage;

  MlFeaturesState({
    this.isLoading = false,
    this.ocrText = const [],
    this.summaryText = '',
    this.combinedText = '',
    this.errorMessage = '',
  });

  MlFeaturesState copyWith({
    bool? isLoading,
    List<String>? ocrText,
    String? summaryText,
    String? combinedText,
    String? errorMessage,
  }) {
    return MlFeaturesState(
      isLoading: isLoading ?? this.isLoading,
      ocrText: ocrText ?? this.ocrText,
      summaryText: summaryText ?? this.summaryText,
      combinedText: combinedText ?? this.combinedText,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
