import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/review_variants.dart';

part 'review_payload.freezed.dart';
part 'review_payload.g.dart';

@freezed
class ReviewPayload with _$ReviewPayload {
  const factory ReviewPayload({
    required String lessonId,
    required String tutorId,
    required String studentId,
    required ReviewVariants reviewType,
    required int rating,
    required String comment,
  }) = _ReviewPayload;

  factory ReviewPayload.fromJson(Map<String, dynamic> json)
    => _$ReviewPayloadFromJson(json);
}
