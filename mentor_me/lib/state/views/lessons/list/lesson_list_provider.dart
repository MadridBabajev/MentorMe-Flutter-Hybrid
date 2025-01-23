import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_list_entry.dart';
import 'package:mentor_me/state/views/lessons/list/lesson_list_state.dart';

final lessonListProvider =
    StateNotifierProvider<LessonListNotifier, LessonListState>((ref) {
  return LessonListNotifier(ref);
});

class LessonListNotifier extends StateNotifier<LessonListState> {
  final Ref _ref;
  final AppLogger _logger;

  LessonListNotifier(this._ref)
      : _logger = AppLogger(),
        super(LessonListState.initial());

  Future<void> fetchLessons() async {
    state = LessonListState.loading();
    try {
      final lessonService = _ref.read(mentorMeApiProvider).lessonService;
      final List<LessonListEntry> lessons =
          await lessonService.getLessonsList();
      state = LessonListState.data(lessons);
    } catch (e, st) {
      _logger.logError("Error fetching lesson list: $e, $st");
      state = LessonListState.error("Failed to fetch lessons");
    }
  }
}
