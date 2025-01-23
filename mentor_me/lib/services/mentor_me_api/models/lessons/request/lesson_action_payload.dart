import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/lesson_actions.dart';

part 'lesson_action_payload.freezed.dart';
part 'lesson_action_payload.g.dart';

@freezed
class LessonActionPayload with _$LessonActionPayload {
  const factory LessonActionPayload({
    required String lessonId,
    @JsonKey(name: 'tutorDecision') required LessonActions lessonAction,
  }) = _LessonActionPayload;

  factory LessonActionPayload.fromJson(Map<String, dynamic> json)
    => _$LessonActionPayloadFromJson(json);
}
