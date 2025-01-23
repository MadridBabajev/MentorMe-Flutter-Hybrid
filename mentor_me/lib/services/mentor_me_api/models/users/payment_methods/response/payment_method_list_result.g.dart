// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodListResultImpl _$$PaymentMethodListResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodListResultImpl(
      paymentMethodList: (json['paymentMethodList'] as List<dynamic>?)
          ?.map((e) => PaymentMethodEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentMethodListResultImplToJson(
        _$PaymentMethodListResultImpl instance) =>
    <String, dynamic>{
      'paymentMethodList': instance.paymentMethodList,
    };
