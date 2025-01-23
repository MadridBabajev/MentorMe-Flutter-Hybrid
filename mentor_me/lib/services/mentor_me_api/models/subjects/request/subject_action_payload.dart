import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/subject_actions.dart';

part 'subject_action_payload.freezed.dart';
part 'subject_action_payload.g.dart';

@freezed
class SubjectActionPayload with _$SubjectActionPayload {
  const factory SubjectActionPayload({
    required String subjectId,
    required SubjectActions subjectAction,
  }) = _SubjectActionPayload;

  factory SubjectActionPayload.fromJson(Map<String, dynamic> json)
    => _$SubjectActionPayloadFromJson(json);
}
