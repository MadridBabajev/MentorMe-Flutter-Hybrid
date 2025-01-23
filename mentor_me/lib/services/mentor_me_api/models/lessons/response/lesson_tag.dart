import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_tag.freezed.dart';
part 'lesson_tag.g.dart';

@freezed
class LessonTag with _$LessonTag {
  const factory LessonTag({
    required String id,
    required String name,
    required String description,
    required DateTime addedAt,
  }) = _LessonTag;

  factory LessonTag.fromJson(Map<String, dynamic> json)
    => _$LessonTagFromJson(json);
}
