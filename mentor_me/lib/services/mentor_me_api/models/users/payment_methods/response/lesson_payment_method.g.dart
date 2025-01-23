// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonPaymentMethodImpl _$$LessonPaymentMethodImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonPaymentMethodImpl(
      id: json['id'] as String,
      paymentMethodType: $enumDecode(
          _$PaymentMethodVariantsEnumMap, json['paymentMethodType']),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$LessonPaymentMethodImplToJson(
        _$LessonPaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethodType':
          _$PaymentMethodVariantsEnumMap[instance.paymentMethodType]!,
      'details': instance.details,
    };

const _$PaymentMethodVariantsEnumMap = {
  PaymentMethodVariants.inApp: 0,
  PaymentMethodVariants.cash: 0,
  PaymentMethodVariants.other: 0,
};
