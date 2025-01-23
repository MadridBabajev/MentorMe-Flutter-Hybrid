// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_name_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectNameListResultImpl _$$SubjectNameListResultImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectNameListResultImpl(
      subjectsList: (json['subjectsList'] as List<dynamic>?)
          ?.map((e) => SubjectNameEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubjectNameListResultImplToJson(
        _$SubjectNameListResultImpl instance) =>
    <String, dynamic>{
      'subjectsList': instance.subjectsList,
    };
