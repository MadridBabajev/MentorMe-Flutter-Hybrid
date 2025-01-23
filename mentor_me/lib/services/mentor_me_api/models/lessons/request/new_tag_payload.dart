import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_tag_payload.freezed.dart';
part 'new_tag_payload.g.dart';


@freezed
class NewTagPayload with _$NewTagPayload {
  const factory NewTagPayload({
    required String lessonId,
    required String name,
    required String description,
  }) = _NewTagPayload;

  factory NewTagPayload.fromJson(Map<String, dynamic> json)
  => _$NewTagPayloadFromJson(json);
}
