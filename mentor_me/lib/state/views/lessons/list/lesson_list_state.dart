import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_list_entry.dart';

enum LessonListStatus { initial, loading, data, error }

class LessonListState {
  final LessonListStatus status;
  final List<LessonListEntry> lessons;
  final String? errorMessage;

  const LessonListState._({
    required this.status,
    required this.lessons,
    this.errorMessage,
  });

  factory LessonListState.initial() =>
      const LessonListState._(status: LessonListStatus.initial, lessons: []);

  factory LessonListState.loading() =>
      const LessonListState._(status: LessonListStatus.loading, lessons: []);

  factory LessonListState.data(List<LessonListEntry> lessons) =>
      LessonListState._(status: LessonListStatus.data, lessons: lessons);

  factory LessonListState.error(String message) => LessonListState._(
      status: LessonListStatus.error, lessons: [], errorMessage: message);
}
