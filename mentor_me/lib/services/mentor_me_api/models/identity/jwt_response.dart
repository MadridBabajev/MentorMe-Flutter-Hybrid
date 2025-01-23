import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_response.freezed.dart';
part 'jwt_response.g.dart';

@freezed
class JWTResponse with _$JWTResponse {
  const factory JWTResponse({
    required String jwt,
    required String refreshToken,
    required int expiresIn,
  }) = _JWTResponse;

  factory JWTResponse.fromJson(Map<String, dynamic> json) =>
      _$JWTResponseFromJson(json);
}
