import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_payload.freezed.dart';
part 'refresh_token_payload.g.dart';

@freezed
class RefreshTokenPayload with _$RefreshTokenPayload {
  const factory RefreshTokenPayload({
    required String jwt,
    required String refreshToken,
  }) = _RefreshTokenPayload;

  factory RefreshTokenPayload.fromJson(Map<String, dynamic> json)
    => _$RefreshTokenPayloadFromJson(json);
}
