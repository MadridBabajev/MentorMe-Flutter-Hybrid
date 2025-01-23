import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/availability_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/base_service.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/availability_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/request/new_availability_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/response/availability_list_result.dart';

class AvailabilityService extends BaseService
    implements AvailabilityServiceContract {
  AvailabilityService({
    required super.logger,
    required super.secureStorageManager,
    required super.baseUrl,
  });

  @override
  Future<List<AvailabilityEntry>> getUserAvailabilities() async {
    try {
      final response = await dio.get(RestEndpoints.getUserAvailabilities);
      if (response.statusCode == 200) {
        final availabilities = AvailabilityListResult.fromJson(response.data);
        return availabilities.availabilityList ?? [];
      } else {
        throw Exception('Failed to fetch availabilities');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching availabilities: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeAvailability(String availabilityId) async {
    try {
      final response = await dio.delete(
        RestEndpoints.removeAvailability,
        queryParameters: {QueryParams.availabilityId: availabilityId},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to remove availability');
      }
    } catch (e) {
      serviceLogger.logError('Error removing availability: $e');
      rethrow;
    }
  }

  @override
  Future<void> addAvailability(NewAvailabilityPayload payload) async {
    try {
      final response = await dio.post(
        RestEndpoints.addAvailability,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add availability');
      }
    } catch (e) {
      serviceLogger.logError('Error adding availability: $e');
      rethrow;
    }
  }
}
