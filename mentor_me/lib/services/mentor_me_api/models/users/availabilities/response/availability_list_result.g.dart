// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailabilityListResultImpl _$$AvailabilityListResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailabilityListResultImpl(
      availabilityList: (json['availabilityList'] as List<dynamic>?)
          ?.map((e) => AvailabilityEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AvailabilityListResultImplToJson(
        _$AvailabilityListResultImpl instance) =>
    <String, dynamic>{
      'availabilityList': instance.availabilityList,
    };
