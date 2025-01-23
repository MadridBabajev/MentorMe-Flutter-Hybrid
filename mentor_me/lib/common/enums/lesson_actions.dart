import 'package:json_annotation/json_annotation.dart';

enum LessonActions {
  @JsonValue(0)
  accept,
  @JsonValue(1)
  decline
}
