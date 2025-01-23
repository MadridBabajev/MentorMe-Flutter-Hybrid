// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailabilityEntryImpl _$$AvailabilityEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailabilityEntryImpl(
      id: json['id'] as String,
      fromHours: json['fromHours'] as String,
      toHours: json['toHours'] as String,
      dayOfTheWeek: $enumDecode(_$DaysOfTheWeekEnumMap, json['dayOfTheWeek']),
    );

Map<String, dynamic> _$$AvailabilityEntryImplToJson(
        _$AvailabilityEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
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
