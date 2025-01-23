import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_search_filters.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/tutor_search_entry.dart';

enum TutorSearchStatus { initial, loading, loaded, error }

class TutorSearchState {
  final TutorSearchStatus status;
  final List<TutorSearchEntry> results;
  final String? errorMessage;
  final TutorSearchFilters filters;

  const TutorSearchState({
    required this.status,
    required this.results,
    required this.filters,
    this.errorMessage,
  });

  factory TutorSearchState.initial() {
    return TutorSearchState(
      status: TutorSearchStatus.initial,
      results: const [],
      filters: const TutorSearchFilters(),
    );
  }

  TutorSearchState copyWith({
    TutorSearchStatus? status,
    List<TutorSearchEntry>? results,
    String? errorMessage,
    TutorSearchFilters? filters,
  }) {
    return TutorSearchState(
      status: status ?? this.status,
      results: results ?? this.results,
      errorMessage: errorMessage,
      filters: filters ?? this.filters,
    );
  }
}
