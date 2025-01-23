// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updated_profile_data_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatedProfileDataResultImpl _$$UpdatedProfileDataResultImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatedProfileDataResultImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobilePhone: json['mobilePhone'] as String,
      title: json['title'] as String?,
      bio: json['bio'] as String?,
      profilePicture: const Base64Uint8ListConverter()
          .fromJson(json['profilePicture'] as String?),
      userType: json['userType'] as String,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UpdatedProfileDataResultImplToJson(
        _$UpdatedProfileDataResultImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobilePhone': instance.mobilePhone,
      'title': instance.title,
      'bio': instance.bio,
      'profilePicture':
          const Base64Uint8ListConverter().toJson(instance.profilePicture),
      'userType': instance.userType,
      'hourlyRate': instance.hourlyRate,
    };
