import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_id.freezed.dart';
part 'lesson_id.g.dart';

@freezed
class LessonId with _$LessonId {
  const factory LessonId({
    required String lessonId,
  }) = _LessonId;

  factory LessonId.fromJson(Map<String, dynamic> json)
    => _$LessonIdFromJson(json);
}
