import 'package:json_annotation/json_annotation.dart';

enum SubjectActions {
  @JsonValue(0)
  addSubject,
  @JsonValue(1)
  removeSubject
}
