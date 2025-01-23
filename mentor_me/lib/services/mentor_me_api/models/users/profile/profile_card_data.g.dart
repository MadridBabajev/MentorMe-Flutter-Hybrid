// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileCardDataImpl _$$ProfileCardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileCardDataImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      averageRating: (json['averageRating'] as num).toDouble(),
      profilePicture: const Base64Uint8ListConverter()
          .fromJson(json['profilePicture'] as String?),
    );

Map<String, dynamic> _$$ProfileCardDataImplToJson(
        _$ProfileCardDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'averageRating': instance.averageRating,
      'profilePicture':
          const Base64Uint8ListConverter().toJson(instance.profilePicture),
    };
