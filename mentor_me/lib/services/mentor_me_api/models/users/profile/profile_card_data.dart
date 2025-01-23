import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';

part 'profile_card_data.freezed.dart';
part 'profile_card_data.g.dart';

@freezed
class ProfileCardData with _$ProfileCardData {
  const factory ProfileCardData({
    required String id,
    required String fullName,
    required double averageRating,
    @Base64Uint8ListConverter() Uint8List? profilePicture,
  }) = _ProfileCardData;

  factory ProfileCardData.fromJson(Map<String, dynamic> json)
    => _$ProfileCardDataFromJson(json);
}
