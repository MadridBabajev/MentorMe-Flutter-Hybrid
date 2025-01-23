import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/lesson_states.dart';

part 'lesson_list_entry.freezed.dart';
part 'lesson_list_entry.g.dart';

@freezed
class LessonListEntry with _$LessonListEntry {
  const factory LessonListEntry({
    required String id,
    required DateTime startTime,
    required DateTime endTime,
    required LessonStates lessonState,
    required String tutorFullName,
    required String studentFullName,
    required String subjectName,
    required double lessonPrice,
  }) = _LessonListEntry;

  factory LessonListEntry.fromJson(Map<String, dynamic> json)
    => _$LessonListEntryFromJson(json);
}
