import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/countries.dart';
import 'package:mentor_me/common/enums/payment_method_variants.dart';

part 'payment_method_entry.freezed.dart';
part 'payment_method_entry.g.dart';

@freezed
class PaymentMethodEntry with _$PaymentMethodEntry {
  const factory PaymentMethodEntry({
    required String id,
    required PaymentMethodVariants paymentMethodType,
    required String details,
    @JsonKey(name: "CardCvv") required String cardCVC,
    required String cardExpirationDate,
    required String cardNumber,
    required String ownerFullName,
    required Countries ownerCountry,
  }) = _PaymentMethodEntry;

  factory PaymentMethodEntry.fromJson(Map<String, dynamic> json)
    => _$PaymentMethodEntryFromJson(json);
}
