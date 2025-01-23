import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';

part 'subject_list_entry.freezed.dart';
part 'subject_list_entry.g.dart';

@freezed
class SubjectListEntry with _$SubjectListEntry {
  const factory SubjectListEntry({
    required String id,
    required String name,
    @Base64Uint8ListConverter() Uint8List? subjectPicture,
  }) = _SubjectListEntry;

  factory SubjectListEntry.fromJson(Map<String, dynamic> json)
    => _$SubjectListEntryFromJson(json);
}
