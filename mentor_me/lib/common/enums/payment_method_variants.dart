import 'package:freezed_annotation/freezed_annotation.dart';

enum PaymentMethodVariants {
  @JsonValue(0)
  inApp,
  @JsonValue(0)
  cash,
  @JsonValue(0)
  other
}
