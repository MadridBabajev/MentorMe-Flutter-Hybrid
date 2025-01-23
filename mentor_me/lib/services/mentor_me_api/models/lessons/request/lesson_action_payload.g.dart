// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_action_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonActionPayloadImpl _$$LessonActionPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonActionPayloadImpl(
      lessonId: json['lessonId'] as String,
      lessonAction: $enumDecode(_$LessonActionsEnumMap, json['tutorDecision']),
    );

Map<String, dynamic> _$$LessonActionPayloadImplToJson(
        _$LessonActionPayloadImpl instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'tutorDecision': _$LessonActionsEnumMap[instance.lessonAction]!,
    };

const _$LessonActionsEnumMap = {
  LessonActions.accept: 0,
  LessonActions.decline: 1,
};
