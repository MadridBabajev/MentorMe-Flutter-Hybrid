// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_banking_details_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorBankingDetailsPayloadImpl _$$TutorBankingDetailsPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$TutorBankingDetailsPayloadImpl(
      bankAccountNumber: json['bankAccountNumber'] as String,
      bankAccountName: json['bankAccountName'] as String,
      bankAccountType: (json['bankAccountType'] as num).toInt(),
    );

Map<String, dynamic> _$$TutorBankingDetailsPayloadImplToJson(
        _$TutorBankingDetailsPayloadImpl instance) =>
    <String, dynamic>{
      'bankAccountNumber': instance.bankAccountNumber,
      'bankAccountName': instance.bankAccountName,
      'bankAccountType': instance.bankAccountType,
    };
