// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_list_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectListEntryImpl _$$SubjectListEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectListEntryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      subjectPicture: const Base64Uint8ListConverter()
          .fromJson(json['subjectPicture'] as String?),
    );

Map<String, dynamic> _$$SubjectListEntryImplToJson(
        _$SubjectListEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subjectPicture':
          const Base64Uint8ListConverter().toJson(instance.subjectPicture),
    };
