import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/payment_method_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/base_service.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/payment_method_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/request/add_payment_method_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/payment_method_list_result.dart';

class PaymentMethodService extends BaseService
    implements PaymentMethodServiceContract {
  PaymentMethodService({
    required super.logger,
    required super.secureStorageManager,
    required super.baseUrl,
  });

  @override
  Future<List<PaymentMethodEntry>> getPaymentMethodsList() async {
    try {
      final response = await dio.get(RestEndpoints.getPaymentMethodsList);
      if (response.statusCode == 200) {
        final paymentMethods = PaymentMethodListResult.fromJson(response.data);
        return paymentMethods.paymentMethodList ?? [];
      } else {
        throw Exception('Failed to fetch payment methods');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching payment methods: $e');
      rethrow;
    }
  }

  @override
  Future<void> removePaymentMethod(String paymentMethodId) async {
    try {
      final response = await dio.delete(
        RestEndpoints.removePaymentMethod,
        queryParameters: {QueryParams.paymentMethodId: paymentMethodId},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to remove payment method');
      }
    } catch (e) {
      serviceLogger.logError('Error removing payment method: $e');
      rethrow;
    }
  }

  @override
  Future<void> addPaymentMethod(AddPaymentMethodPayload payload) async {
    try {
      final response = await dio.post(
        RestEndpoints.addPaymentMethod,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add payment method');
      }
    } catch (e) {
      serviceLogger.logError('Error adding payment method: $e');
      rethrow;
    }
  }
}
