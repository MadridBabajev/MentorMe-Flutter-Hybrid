import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/days_of_the_week.dart';

part 'new_availability_payload.freezed.dart';
part 'new_availability_payload.g.dart';

@freezed
class NewAvailabilityPayload with _$NewAvailabilityPayload {
  const factory NewAvailabilityPayload({
    required String fromHours,
    required String toHours,
    required DaysOfTheWeek dayOfTheWeek,
  }) = _NewAvailabilityPayload;

  factory NewAvailabilityPayload.fromJson(Map<String, dynamic> json)
    => _$NewAvailabilityPayloadFromJson(json);
}
