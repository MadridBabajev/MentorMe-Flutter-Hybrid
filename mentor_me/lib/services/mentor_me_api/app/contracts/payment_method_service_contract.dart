import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/payment_method_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/request/add_payment_method_payload.dart';

abstract class PaymentMethodServiceContract {
  /// Get the lessons_list of payment methods
  Future<List<PaymentMethodEntry>> getPaymentMethodsList();

  /// Remove a payment method by ID
  Future<void> removePaymentMethod(String paymentMethodId);

  /// Add a new payment method
  Future<void> addPaymentMethod(AddPaymentMethodPayload payload);
}
