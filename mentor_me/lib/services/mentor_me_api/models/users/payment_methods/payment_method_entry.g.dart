// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodEntryImpl _$$PaymentMethodEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodEntryImpl(
      id: json['id'] as String,
      paymentMethodType: $enumDecode(
          _$PaymentMethodVariantsEnumMap, json['paymentMethodType']),
      details: json['details'] as String,
      cardCVC: json['CardCvv'] as String,
      cardExpirationDate: json['cardExpirationDate'] as String,
      cardNumber: json['cardNumber'] as String,
      ownerFullName: json['ownerFullName'] as String,
      ownerCountry: $enumDecode(_$CountriesEnumMap, json['ownerCountry']),
    );

Map<String, dynamic> _$$PaymentMethodEntryImplToJson(
        _$PaymentMethodEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethodType':
          _$PaymentMethodVariantsEnumMap[instance.paymentMethodType]!,
      'details': instance.details,
      'CardCvv': instance.cardCVC,
      'cardExpirationDate': instance.cardExpirationDate,
      'cardNumber': instance.cardNumber,
      'ownerFullName': instance.ownerFullName,
      'ownerCountry': _$CountriesEnumMap[instance.ownerCountry]!,
    };

const _$PaymentMethodVariantsEnumMap = {
  PaymentMethodVariants.inApp: 0,
  PaymentMethodVariants.cash: 0,
  PaymentMethodVariants.other: 0,
};

const _$CountriesEnumMap = {
  Countries.estonia: 'estonia',
  Countries.latvia: 'latvia',
  Countries.lithuania: 'lithuania',
};
