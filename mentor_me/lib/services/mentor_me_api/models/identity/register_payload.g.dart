// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterPayloadImpl _$$RegisterPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPayloadImpl(
      email: json['email'] as String,
      mobilePhone: json['mobilePhone'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      isTutor: json['isTutor'] as bool,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$RegisterPayloadImplToJson(
        _$RegisterPayloadImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'mobilePhone': instance.mobilePhone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'isTutor': instance.isTutor,
      'country': instance.country,
    };
