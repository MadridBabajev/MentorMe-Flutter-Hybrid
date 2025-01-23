// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_action_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectActionPayloadImpl _$$SubjectActionPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectActionPayloadImpl(
      subjectId: json['subjectId'] as String,
      subjectAction:
          $enumDecode(_$SubjectActionsEnumMap, json['subjectAction']),
    );

Map<String, dynamic> _$$SubjectActionPayloadImplToJson(
        _$SubjectActionPayloadImpl instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'subjectAction': _$SubjectActionsEnumMap[instance.subjectAction]!,
    };

const _$SubjectActionsEnumMap = {
  SubjectActions.addSubject: 0,
  SubjectActions.removeSubject: 1,
};
