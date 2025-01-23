import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_search_filters.dart';
import 'package:mentor_me/state/views/user/tutor_search/tutor_search_state.dart';

final tutorSearchProvider =
StateNotifierProvider<TutorSearchNotifier, TutorSearchState>((ref) {
  return TutorSearchNotifier(ref);
});

class TutorSearchNotifier extends StateNotifier<TutorSearchState> {
  final Ref ref;
  final AppLogger _logger;

  TutorSearchNotifier(this.ref)
      : _logger = AppLogger(),
        super(TutorSearchState.initial());

  void updateFilters(TutorSearchFilters newFilters) {
    state = state.copyWith(filters: newFilters);
  }

  Future<void> fetchTutors() async {
    state = state.copyWith(status: TutorSearchStatus.loading, errorMessage: null);
    try {
      final profileService = ref.read(mentorMeApiProvider).profileService;
      final tutorsList = await profileService.getTutorsList(state.filters);

      state = state.copyWith(
        status: TutorSearchStatus.loaded,
        results: tutorsList,
      );
    } catch (e, st) {
      _logger.logError("Error fetching tutors: $e\n$st");
      state = state.copyWith(
        status: TutorSearchStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}