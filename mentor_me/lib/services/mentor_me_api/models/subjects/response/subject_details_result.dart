import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/converters/uint8_converter.dart';

part 'subject_details_result.freezed.dart';
part 'subject_details_result.g.dart';

@freezed
class SubjectDetailsResult with _$SubjectDetailsResult {
  const factory SubjectDetailsResult(
      {required String id,
      required String name,
      required String description,
      @JsonKey(name: "taughtBy") required int taughtByPeopleCount,
      @JsonKey(name: "learnedBy") required int learnedByPeopleCount,
      @Base64Uint8ListConverter() required Uint8List? subjectPicture,
      required bool? isAdded}) = _SubjectDetailsResult;

  factory SubjectDetailsResult.fromJson(Map<String, dynamic> json)
    => _$SubjectDetailsResultFromJson(json);
}
