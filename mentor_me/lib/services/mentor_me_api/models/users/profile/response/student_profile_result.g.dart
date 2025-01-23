// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentProfileResultImpl _$$StudentProfileResultImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentProfileResultImpl(
      id: json['id'] as String,
      notificationsEnabled: json['notificationsEnabled'] as bool,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobilePhone: json['mobilePhone'] as String,
      balance: (json['balance'] as num).toDouble(),
      averageRating: (json['averageRating'] as num).toDouble(),
      title: json['title'] as String,
      bio: json['bio'] as String,
      profilePicture: const Base64Uint8ListConverter()
          .fromJson(json['profilePicture'] as String?),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPublic: json['isPublic'] as bool,
      numberOfClasses: (json['numberOfClasses'] as num).toInt(),
    );

Map<String, dynamic> _$$StudentProfileResultImplToJson(
        _$StudentProfileResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationsEnabled': instance.notificationsEnabled,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobilePhone': instance.mobilePhone,
      'balance': instance.balance,
      'averageRating': instance.averageRating,
      'title': instance.title,
      'bio': instance.bio,
      'profilePicture':
          const Base64Uint8ListConverter().toJson(instance.profilePicture),
      'subjects': instance.subjects,
      'isPublic': instance.isPublic,
      'numberOfClasses': instance.numberOfClasses,
    };
