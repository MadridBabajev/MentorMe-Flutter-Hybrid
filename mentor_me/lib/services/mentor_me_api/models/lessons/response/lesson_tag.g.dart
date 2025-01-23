// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonTagImpl _$$LessonTagImplFromJson(Map<String, dynamic> json) =>
    _$LessonTagImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$$LessonTagImplToJson(_$LessonTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'addedAt': instance.addedAt.toIso8601String(),
    };
