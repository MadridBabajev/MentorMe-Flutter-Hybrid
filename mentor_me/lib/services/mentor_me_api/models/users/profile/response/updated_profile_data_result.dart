import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';

part 'updated_profile_data_result.freezed.dart';
part 'updated_profile_data_result.g.dart';

@freezed
class UpdatedProfileDataResult with _$UpdatedProfileDataResult {
  const factory UpdatedProfileDataResult({
    required String firstName,
    required String lastName,
    required String mobilePhone,
    String? title,
    String? bio,
    @Base64Uint8ListConverter() Uint8List? profilePicture,
    required String userType,
    double? hourlyRate,
  }) = _UpdatedProfileDataResult;

  factory UpdatedProfileDataResult.fromJson(Map<String, dynamic> json)
    => _$UpdatedProfileDataResultFromJson(json);
}
