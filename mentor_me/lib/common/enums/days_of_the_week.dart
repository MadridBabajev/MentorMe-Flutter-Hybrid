import 'package:freezed_annotation/freezed_annotation.dart';

enum DaysOfTheWeek {
  @JsonValue(0)
  monday,
  @JsonValue(1)
  tuesday,
  @JsonValue(2)
  wednesday,
  @JsonValue(3)
  thursday,
  @JsonValue(4)
  friday,
  @JsonValue(5)
  saturday,
  @JsonValue(6)
  sunday
}
