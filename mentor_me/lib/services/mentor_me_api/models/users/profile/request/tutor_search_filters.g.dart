// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_search_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorSearchFiltersImpl _$$TutorSearchFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$TutorSearchFiltersImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      minClassesCount: (json['minClassesCount'] as num?)?.toInt(),
      maxClassesCount: (json['maxClassesCount'] as num?)?.toInt(),
      minHourlyRate: (json['minHourlyRate'] as num?)?.toDouble(),
      maxHourlyRate: (json['maxHourlyRate'] as num?)?.toDouble(),
      minAverageRating: (json['minAverageRating'] as num?)?.toDouble(),
      maxAverageRating: (json['maxAverageRating'] as num?)?.toDouble(),
      subjectIds: (json['subjectIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TutorSearchFiltersImplToJson(
        _$TutorSearchFiltersImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'minClassesCount': instance.minClassesCount,
      'maxClassesCount': instance.maxClassesCount,
      'minHourlyRate': instance.minHourlyRate,
      'maxHourlyRate': instance.maxHourlyRate,
      'minAverageRating': instance.minAverageRating,
      'maxAverageRating': instance.maxAverageRating,
      'subjectIds': instance.subjectIds,
    };
