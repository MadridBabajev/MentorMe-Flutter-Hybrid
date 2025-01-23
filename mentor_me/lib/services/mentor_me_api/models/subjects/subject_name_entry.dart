import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_name_entry.freezed.dart';
part 'subject_name_entry.g.dart';

@freezed
class SubjectNameEntry with _$SubjectNameEntry {
  const factory SubjectNameEntry({
    required String id,
    required String name,
  }) = _SubjectNameEntry;

  factory SubjectNameEntry.fromJson(Map<String, dynamic> json)
    => _$SubjectNameEntryFromJson(json);
}
