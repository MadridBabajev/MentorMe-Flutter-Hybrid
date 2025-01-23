import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_payload.freezed.dart';
part 'logout_payload.g.dart';

@freezed
class LogoutPayload with _$LogoutPayload {
  const factory LogoutPayload({
    required String refreshToken,
  }) = _LogoutPayload;

  factory LogoutPayload.fromJson(Map<String, dynamic> json) => _$LogoutPayloadFromJson(json);
}
