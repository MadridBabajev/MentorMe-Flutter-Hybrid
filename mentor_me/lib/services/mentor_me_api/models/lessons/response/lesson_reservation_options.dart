import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/request/new_availability_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/lesson_payment_method.dart';

part 'lesson_reservation_options.freezed.dart';
part 'lesson_reservation_options.g.dart';

@freezed
class LessonReservationOptions with _$LessonReservationOptions {
  const factory LessonReservationOptions({
    required List<LessonPaymentMethod>? paymentMethods,
    required List<NewAvailabilityPayload>? availabilities,
    required List<SubjectNameEntry>? subjects,
  }) = _LessonReservationOptions;

  factory LessonReservationOptions.fromJson(Map<String, dynamic> json)
    => _$LessonReservationOptionsFromJson(json);
}
