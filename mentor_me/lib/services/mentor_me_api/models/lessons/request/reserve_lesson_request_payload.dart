import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/typedef/service_models.dart';

part 'reserve_lesson_request_payload.freezed.dart';
part 'reserve_lesson_request_payload.g.dart';

@freezed
class ReserveLessonRequestPayload with _$ReserveLessonRequestPayload {
  const factory ReserveLessonRequestPayload({
    required SelectedTutorId tutorId,
    required SelectedPaymentMethodId paymentMethodId,
    required SelectedTutorSubjectId subjectId,
    @JsonKey(name: 'lessonStartTime') required ReservedLessonsStartTime startTime,
    @JsonKey(name: 'lessonEndTime') required ReservedLessonsEndTime endTime,
  }) = _ReserveLessonRequestPayload;

  factory ReserveLessonRequestPayload.fromJson(Map<String, dynamic> json)
    => _$ReserveLessonRequestPayloadFromJson(json);
}
