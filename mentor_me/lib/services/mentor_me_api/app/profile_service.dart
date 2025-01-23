import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/profile_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/base_service.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_banking_details_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_search_filters.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/updated_profile_data_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/student_profile_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/tutor_banking_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/tutor_profile_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/updated_profile_data_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/tutor_search_entry.dart';

class ProfileService extends BaseService implements ProfileServiceContract {
  ProfileService({
    required super.logger,
    required super.secureStorageManager,
    required super.baseUrl,
  });

  @override
  Future<StudentProfileResult> getStudentProfile(
      {String? visitedUserId}) async {
    try {
      final response = await dio.get(
        RestEndpoints.getStudentProfile,
        queryParameters: visitedUserId != null
            ? {QueryParams.visitedUserId: visitedUserId}
            : null,
      );
      if (response.statusCode == 200) {
        return StudentProfileResult.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch student profile');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching student profile: $e');
      rethrow;
    }
  }

  @override
  Future<TutorProfileResult> getTutorProfile({String? visitedUserId}) async {
    try {
      final response = await dio.get(
        RestEndpoints.getTutorProfile,
        queryParameters: visitedUserId != null
            ? {QueryParams.visitedUserId: visitedUserId}
            : null,
      );
      if (response.statusCode == 200) {
        return TutorProfileResult.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch tutor profile');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching tutor profile: $e');
      rethrow;
    }
  }

  @override
  Future<List<TutorSearchEntry>> getTutorsList(
      TutorSearchFilters filters) async {
    try {
      final response = await dio.post(
        RestEndpoints.getSearchedTutorsList,
        data: filters.toJson(),
      );
      if (response.statusCode == 200) {
        final rawList = response.data as List;
        final tutors = rawList
            .map((json) => TutorSearchEntry.fromJson(json as Map<String, dynamic>))
            .toList();
        return tutors;
      } else {
        throw Exception('Failed to fetch tutors');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching tutors list: $e');
      rethrow;
    }
  }

  @override
  Future<TutorBankingDetailsResult> getTutorBankingDetails() async {
    try {
      final response = await dio.get(RestEndpoints.getTutorBankingDetails);
      if (response.statusCode == 200) {
        return TutorBankingDetailsResult.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch tutor banking details');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching tutor banking details: $e');
      rethrow;
    }
  }

  @override
  Future<void> editTutorBankingDetails(
      TutorBankingDetailsPayload payload) async {
    try {
      final response = await dio.put(
        RestEndpoints.updateBankingDetails,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update tutor banking details');
      }
    } catch (e) {
      serviceLogger.logError('Error updating tutor banking details: $e');
      rethrow;
    }
  }

  @override
  Future<UpdatedProfileDataResult> getEditProfileData() async {
    try {
      final response = await dio.get(RestEndpoints.getEditableProfileData);
      if (response.statusCode == 200) {
        return UpdatedProfileDataResult.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch editable profile data');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching editable profile data: $e');
      rethrow;
    }
  }

  @override
  Future<void> editProfileData(UpdatedProfileDataPayload payload) async {
    try {
      final response = await dio.put(
        RestEndpoints.updateProfileDetails,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update profile data');
      }
    } catch (e) {
      serviceLogger.logError('Error updating profile data: $e');
      rethrow;
    }
  }
}
