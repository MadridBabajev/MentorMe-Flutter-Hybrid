// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewPayloadImpl _$$ReviewPayloadImplFromJson(Map<String, dynamic> json) =>
    _$ReviewPayloadImpl(
      lessonId: json['lessonId'] as String,
      tutorId: json['tutorId'] as String,
      studentId: json['studentId'] as String,
      reviewType: $enumDecode(_$ReviewVariantsEnumMap, json['reviewType']),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$ReviewPayloadImplToJson(_$ReviewPayloadImpl instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'tutorId': instance.tutorId,
      'studentId': instance.studentId,
      'reviewType': _$ReviewVariantsEnumMap[instance.reviewType]!,
      'rating': instance.rating,
      'comment': instance.comment,
    };

const _$ReviewVariantsEnumMap = {
  ReviewVariants.reviewOfStudent: 'reviewOfStudent',
  ReviewVariants.reviewOfTutor: 'reviewOfTutor',
};
