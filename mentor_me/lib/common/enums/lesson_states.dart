import 'package:json_annotation/json_annotation.dart';

enum LessonStates {
  @JsonValue(0)
  pending,
  @JsonValue(1)
  upcoming,
  @JsonValue(2)
  finished,
  @JsonValue(3)
  canceled,
}
