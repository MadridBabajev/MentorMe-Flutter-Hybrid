import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/payment_method_entry.dart';

part 'payment_method_list_result.freezed.dart';
part 'payment_method_list_result.g.dart';

@freezed
class PaymentMethodListResult with _$PaymentMethodListResult {
  const factory PaymentMethodListResult({
    required List<PaymentMethodEntry>? paymentMethodList,
  }) = _PaymentMethodListResult;

  factory PaymentMethodListResult.fromJson(Map<String, dynamic> json)
    => _$PaymentMethodListResultFromJson(json);
}
