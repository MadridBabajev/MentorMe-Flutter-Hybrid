// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_banking_details_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorBankingDetailsResultImpl _$$TutorBankingDetailsResultImplFromJson(
        Map<String, dynamic> json) =>
    _$TutorBankingDetailsResultImpl(
      bankAccountNumber: json['bankAccountNumber'] as String,
      bankAccountName: json['bankAccountName'] as String,
      bankAccountType:
          $enumDecode(_$BankAccountVariantsEnumMap, json['bankAccountType']),
    );

Map<String, dynamic> _$$TutorBankingDetailsResultImplToJson(
        _$TutorBankingDetailsResultImpl instance) =>
    <String, dynamic>{
      'bankAccountNumber': instance.bankAccountNumber,
      'bankAccountName': instance.bankAccountName,
      'bankAccountType':
          _$BankAccountVariantsEnumMap[instance.bankAccountType]!,
    };

const _$BankAccountVariantsEnumMap = {
  BankAccountVariants.personal: 'personal',
  BankAccountVariants.business: 'business',
};
