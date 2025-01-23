// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_list_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonListEntryImpl _$$LessonListEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonListEntryImpl(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      lessonState: $enumDecode(_$LessonStatesEnumMap, json['lessonState']),
      tutorFullName: json['tutorFullName'] as String,
      studentFullName: json['studentFullName'] as String,
      subjectName: json['subjectName'] as String,
      lessonPrice: (json['lessonPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$LessonListEntryImplToJson(
        _$LessonListEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'lessonState': _$LessonStatesEnumMap[instance.lessonState]!,
      'tutorFullName': instance.tutorFullName,
      'studentFullName': instance.studentFullName,
      'subjectName': instance.subjectName,
      'lessonPrice': instance.lessonPrice,
    };

const _$LessonStatesEnumMap = {
  LessonStates.pending: 0,
  LessonStates.upcoming: 1,
  LessonStates.finished: 2,
  LessonStates.canceled: 3,
};
