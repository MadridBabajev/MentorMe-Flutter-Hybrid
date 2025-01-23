import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/availability_entry.dart';

part 'availability_list_result.freezed.dart';
part 'availability_list_result.g.dart';

@freezed
class AvailabilityListResult with _$AvailabilityListResult {
  const factory AvailabilityListResult({
    required List<AvailabilityEntry>? availabilityList,
  }) = _AvailabilityListResult;

  factory AvailabilityListResult.fromJson(Map<String, dynamic> json)
    => _$AvailabilityListResultFromJson(json);
}
