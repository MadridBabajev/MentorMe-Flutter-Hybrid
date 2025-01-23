import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_method_payload.freezed.dart';
part 'add_payment_method_payload.g.dart';

@freezed
class AddPaymentMethodPayload with _$AddPaymentMethodPayload {
  const factory AddPaymentMethodPayload({
    required String details,
    @JsonKey(name: "CardCvv") required String cardCVC,
    required String cardExpirationDate,
    required String cardNumber,
  }) = _AddPaymentMethodPayload;

  factory AddPaymentMethodPayload.fromJson(Map<String, dynamic> json)
    => _$AddPaymentMethodPayloadFromJson(json);
}
