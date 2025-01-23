import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutor_search_filters.freezed.dart';
part 'tutor_search_filters.g.dart';

@freezed
class TutorSearchFilters with _$TutorSearchFilters {
  const factory TutorSearchFilters({
    String? firstName,
    String? lastName,
    int? minClassesCount,
    int? maxClassesCount,
    double? minHourlyRate,
    double? maxHourlyRate,
    double? minAverageRating,
    double? maxAverageRating,
    @Default([]) List<String> subjectIds,
  }) = _TutorSearchFilters;

  factory TutorSearchFilters.fromJson(Map<String, dynamic> json)
    => _$TutorSearchFiltersFromJson(json);
}
