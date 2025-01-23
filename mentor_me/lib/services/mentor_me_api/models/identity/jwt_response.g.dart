// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JWTResponseImpl _$$JWTResponseImplFromJson(Map<String, dynamic> json) =>
    _$JWTResponseImpl(
      jwt: json['jwt'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$$JWTResponseImplToJson(_$JWTResponseImpl instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
