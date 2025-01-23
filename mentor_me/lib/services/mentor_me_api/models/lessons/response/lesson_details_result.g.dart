// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_details_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonDetailsResultImpl _$$LessonDetailsResultImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonDetailsResultImpl(
      id: json['id'] as String,
      paymentId: json['paymentId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      lessonState: $enumDecode(_$LessonStatesEnumMap, json['lessonState']),
      price: (json['price'] as num).toDouble(),
      viewedByTutor: json['viewedByTutor'] as bool,
      userCanWriteReview: json['userCanWriteReview'] as bool,
      studentPaymentMethod: LessonPaymentMethod.fromJson(
          json['studentPaymentMethod'] as Map<String, dynamic>),
      subject:
          SubjectListEntry.fromJson(json['subject'] as Map<String, dynamic>),
      lessonStudent: ProfileCardData.fromJson(
          json['lessonStudent'] as Map<String, dynamic>),
      lessonTutor:
          ProfileCardData.fromJson(json['lessonTutor'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => LessonTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LessonDetailsResultImplToJson(
        _$LessonDetailsResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentId': instance.paymentId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'lessonState': _$LessonStatesEnumMap[instance.lessonState]!,
      'price': instance.price,
      'viewedByTutor': instance.viewedByTutor,
      'userCanWriteReview': instance.userCanWriteReview,
      'studentPaymentMethod': instance.studentPaymentMethod,
      'subject': instance.subject,
      'lessonStudent': instance.lessonStudent,
      'lessonTutor': instance.lessonTutor,
      'tags': instance.tags,
    };

const _$LessonStatesEnumMap = {
  LessonStates.pending: 0,
  LessonStates.upcoming: 1,
  LessonStates.finished: 2,
  LessonStates.canceled: 3,
};
