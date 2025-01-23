import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';

part 'tutor_search_entry.freezed.dart';
part 'tutor_search_entry.g.dart';

@freezed
class TutorSearchEntry with _$TutorSearchEntry {
  const factory TutorSearchEntry({
    required String id,
    required String firstName,
    required String lastName,
    required String title,
    required double hourlyRate,
    required double averageRating,
    required int classesTutored,
    @Base64Uint8ListConverter() Uint8List? profilePicture,
  }) = _TutorSearchEntry;

  factory TutorSearchEntry.fromJson(Map<String, dynamic> json)
    => _$TutorSearchEntryFromJson(json);
}
