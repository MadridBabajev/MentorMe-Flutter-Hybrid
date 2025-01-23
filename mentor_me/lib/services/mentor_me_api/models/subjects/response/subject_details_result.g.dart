// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_details_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectDetailsResultImpl _$$SubjectDetailsResultImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectDetailsResultImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      taughtByPeopleCount: (json['taughtBy'] as num).toInt(),
      learnedByPeopleCount: (json['learnedBy'] as num).toInt(),
      subjectPicture: const Base64Uint8ListConverter()
          .fromJson(json['subjectPicture'] as String?),
      isAdded: json['isAdded'] as bool?,
    );

Map<String, dynamic> _$$SubjectDetailsResultImplToJson(
        _$SubjectDetailsResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taughtBy': instance.taughtByPeopleCount,
      'learnedBy': instance.learnedByPeopleCount,
      'subjectPicture':
          const Base64Uint8ListConverter().toJson(instance.subjectPicture),
      'isAdded': instance.isAdded,
    };
