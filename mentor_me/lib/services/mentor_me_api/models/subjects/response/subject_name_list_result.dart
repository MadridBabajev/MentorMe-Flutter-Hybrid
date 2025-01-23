import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';

part 'subject_name_list_result.freezed.dart';
part 'subject_name_list_result.g.dart';

@freezed
class SubjectNameListResult with _$SubjectNameListResult {
  const factory SubjectNameListResult({
    required List<SubjectNameEntry>? subjectsList,
  }) = _SubjectNameListResult;

  factory SubjectNameListResult.fromJson(Map<String, dynamic> json)
    => _$SubjectNameListResultFromJson(json);
}
