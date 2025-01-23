// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_lesson_request_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReserveLessonRequestPayloadImpl _$$ReserveLessonRequestPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$ReserveLessonRequestPayloadImpl(
      tutorId: json['tutorId'] as String,
      paymentMethodId: json['paymentMethodId'] as String,
      subjectId: json['subjectId'] as String,
      startTime: DateTime.parse(json['lessonStartTime'] as String),
      endTime: DateTime.parse(json['lessonEndTime'] as String),
    );

Map<String, dynamic> _$$ReserveLessonRequestPayloadImplToJson(
        _$ReserveLessonRequestPayloadImpl instance) =>
    <String, dynamic>{
      'tutorId': instance.tutorId,
      'paymentMethodId': instance.paymentMethodId,
      'subjectId': instance.subjectId,
      'lessonStartTime': instance.startTime.toIso8601String(),
      'lessonEndTime': instance.endTime.toIso8601String(),
    };
