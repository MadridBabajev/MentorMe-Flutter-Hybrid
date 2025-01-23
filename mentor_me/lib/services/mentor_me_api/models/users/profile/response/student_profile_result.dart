import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';

part 'student_profile_result.freezed.dart';

part 'student_profile_result.g.dart';

@freezed
class StudentProfileResult with _$StudentProfileResult {
  const factory StudentProfileResult({
    required String id,
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
  }) = _StudentProfileResult;

  factory StudentProfileResult.fromJson(Map<String, dynamic> json)
    => _$StudentProfileResultFromJson(json);
}
