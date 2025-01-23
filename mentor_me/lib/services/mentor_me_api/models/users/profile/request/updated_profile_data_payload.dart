import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';

part 'updated_profile_data_payload.freezed.dart';
part 'updated_profile_data_payload.g.dart';

@freezed
class UpdatedProfileDataPayload with _$UpdatedProfileDataPayload {
  const factory UpdatedProfileDataPayload({
    required String firstName,
    required String lastName,
    required String mobilePhone,
    required String title,
    required String bio,
    @Base64Uint8ListConverter() Uint8List? profilePicture,
    required String userType,
    double? hourlyRate,
  }) = _UpdatedProfileDataPayload;

  factory UpdatedProfileDataPayload.fromJson(Map<String, dynamic> json)
    => _$UpdatedProfileDataPayloadFromJson(json);
}
