import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/availability_entry.dart';

part 'tutor_profile_result.freezed.dart';
part 'tutor_profile_result.g.dart';

@freezed
class TutorProfileResult with _$TutorProfileResult {
  const factory TutorProfileResult(
      {required String id,
      required bool notificationsEnabled,
      required String firstName,
      required String lastName,
      required String mobilePhone,
      required double balance,
      required double averageRating,
      required String title,
      required String bio,
      @Base64Uint8ListConverter() Uint8List? profilePicture,
      List<SubjectListEntry>? subjects,
      required bool isPublic,
      required int numberOfClasses,
      required double hourlyRate,
      List<AvailabilityEntry>? availabilities}) = _TutorProfileResult;

  factory TutorProfileResult.fromJson(Map<String, dynamic> json)
    => _$TutorProfileResultFromJson(json);
}
