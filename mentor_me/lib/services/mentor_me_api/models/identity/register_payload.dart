import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_payload.freezed.dart';
part 'register_payload.g.dart';

@freezed
class RegisterPayload with _$RegisterPayload {
  const factory RegisterPayload({
    required String email,
    required String mobilePhone,
    required String password,
    required String confirmPassword,
    required String firstname,
    required String lastname,
    required bool isTutor,
    required String country,
  }) = _RegisterPayload;

  factory RegisterPayload.fromJson(Map<String, dynamic> json)
    => _$RegisterPayloadFromJson(json);
}
