import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/availability_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/request/new_availability_payload.dart';

abstract class AvailabilityServiceContract {
  /// Fetch all availabilities for the logged-in user
  Future<List<AvailabilityEntry>> getUserAvailabilities();

  /// Remove an availability by ID
  Future<void> removeAvailability(String availabilityId);

  /// Add a new availability
  Future<void> addAvailability(NewAvailabilityPayload payload);
}
