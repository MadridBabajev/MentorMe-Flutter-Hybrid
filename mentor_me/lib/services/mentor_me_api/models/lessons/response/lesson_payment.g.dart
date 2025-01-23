// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonPaymentImpl _$$LessonPaymentImplFromJson(Map<String, dynamic> json) =>
    _$LessonPaymentImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      additionalFees: (json['additionalFees'] as num?)?.toDouble(),
      description: json['description'] as String,
      senderStudentFullName: json['senderStudentFullName'] as String,
      recipientTutorFullName: json['recipientTutorFullName'] as String,
      paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['paymentStatus']),
      paymentMethodType: $enumDecode(
          _$PaymentMethodVariantsEnumMap, json['paymentMethodType']),
    );

Map<String, dynamic> _$$LessonPaymentImplToJson(_$LessonPaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'additionalFees': instance.additionalFees,
      'description': instance.description,
      'senderStudentFullName': instance.senderStudentFullName,
      'recipientTutorFullName': instance.recipientTutorFullName,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'paymentMethodType':
          _$PaymentMethodVariantsEnumMap[instance.paymentMethodType]!,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.reserved: 'reserved',
  PaymentStatus.refunded: 'refunded',
  PaymentStatus.resolved: 'resolved',
  PaymentStatus.failed: 'failed',
};

const _$PaymentMethodVariantsEnumMap = {
  PaymentMethodVariants.inApp: 0,
  PaymentMethodVariants.cash: 0,
  PaymentMethodVariants.other: 0,
};
