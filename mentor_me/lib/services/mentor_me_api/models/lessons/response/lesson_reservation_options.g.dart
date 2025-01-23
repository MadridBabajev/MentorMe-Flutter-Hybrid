// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_reservation_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonReservationOptionsImpl _$$LessonReservationOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonReservationOptionsImpl(
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
          ?.map((e) => LessonPaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilities: (json['availabilities'] as List<dynamic>?)
          ?.map(
              (e) => NewAvailabilityPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectNameEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LessonReservationOptionsImplToJson(
        _$LessonReservationOptionsImpl instance) =>
    <String, dynamic>{
      'paymentMethods': instance.paymentMethods,
      'availabilities': instance.availabilities,
      'subjects': instance.subjects,
    };
