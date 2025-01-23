// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_availability_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewAvailabilityPayloadImpl _$$NewAvailabilityPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$NewAvailabilityPayloadImpl(
      fromHours: json['fromHours'] as String,
      toHours: json['toHours'] as String,
      dayOfTheWeek: $enumDecode(_$DaysOfTheWeekEnumMap, json['dayOfTheWeek']),
    );

Map<String, dynamic> _$$NewAvailabilityPayloadImplToJson(
        _$NewAvailabilityPayloadImpl instance) =>
    <String, dynamic>{
      'fromHours': instance.fromHours,
      'toHours': instance.toHours,
      'dayOfTheWeek': _$DaysOfTheWeekEnumMap[instance.dayOfTheWeek]!,
    };

const _$DaysOfTheWeekEnumMap = {
  DaysOfTheWeek.monday: 0,
  DaysOfTheWeek.tuesday: 1,
  DaysOfTheWeek.wednesday: 2,
  DaysOfTheWeek.thursday: 3,
  DaysOfTheWeek.friday: 4,
  DaysOfTheWeek.saturday: 5,
  DaysOfTheWeek.sunday: 6,
};
