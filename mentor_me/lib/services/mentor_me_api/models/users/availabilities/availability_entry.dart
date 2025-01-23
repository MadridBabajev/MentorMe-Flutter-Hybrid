import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/days_of_the_week.dart';

part 'availability_entry.freezed.dart';
part 'availability_entry.g.dart';

@freezed
class AvailabilityEntry with _$AvailabilityEntry {
  const factory AvailabilityEntry({
    required String id,
    required String fromHours,
    required String toHours,
    required DaysOfTheWeek dayOfTheWeek,
  }) = _AvailabilityEntry;

  factory AvailabilityEntry.fromJson(Map<String, dynamic> json)
    => _$AvailabilityEntryFromJson(json);
}
