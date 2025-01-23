// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenPayloadImpl _$$RefreshTokenPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenPayloadImpl(
      jwt: json['jwt'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$RefreshTokenPayloadImplToJson(
        _$RefreshTokenPayloadImpl instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'refreshToken': instance.refreshToken,
    };
