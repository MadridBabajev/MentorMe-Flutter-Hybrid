// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_search_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorSearchEntryImpl _$$TutorSearchEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$TutorSearchEntryImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      title: json['title'] as String,
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      averageRating: (json['averageRating'] as num).toDouble(),
      classesTutored: (json['classesTutored'] as num).toInt(),
      profilePicture: const Base64Uint8ListConverter()
          .fromJson(json['profilePicture'] as String?),
    );

Map<String, dynamic> _$$TutorSearchEntryImplToJson(
        _$TutorSearchEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'hourlyRate': instance.hourlyRate,
      'averageRating': instance.averageRating,
      'classesTutored': instance.classesTutored,
      'profilePicture':
          const Base64Uint8ListConverter().toJson(instance.profilePicture),
    };
