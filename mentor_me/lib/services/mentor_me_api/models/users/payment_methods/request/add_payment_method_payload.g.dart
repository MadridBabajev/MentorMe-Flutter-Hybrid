// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_payment_method_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddPaymentMethodPayloadImpl _$$AddPaymentMethodPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$AddPaymentMethodPayloadImpl(
      details: json['details'] as String,
      cardCVC: json['CardCvv'] as String,
      cardExpirationDate: json['cardExpirationDate'] as String,
      cardNumber: json['cardNumber'] as String,
    );

Map<String, dynamic> _$$AddPaymentMethodPayloadImplToJson(
        _$AddPaymentMethodPayloadImpl instance) =>
    <String, dynamic>{
      'details': instance.details,
      'CardCvv': instance.cardCVC,
      'cardExpirationDate': instance.cardExpirationDate,
      'cardNumber': instance.cardNumber,
    };
