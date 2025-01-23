import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

class Base64Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Base64Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) => json == null ? null : base64Decode(json);

  @override
  String? toJson(Uint8List? object) =>
      object == null ? null : base64Encode(object);
}
