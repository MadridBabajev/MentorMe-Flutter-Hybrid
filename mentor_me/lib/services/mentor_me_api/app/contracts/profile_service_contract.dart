import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_banking_details_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_search_filters.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/updated_profile_data_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/student_profile_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/tutor_banking_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/tutor_profile_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/updated_profile_data_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/tutor_search_entry.dart';

abstract class ProfileServiceContract {
  /// Get the student profile
  Future<StudentProfileResult> getStudentProfile({String? visitedUserId});

  /// Get the tutor profile
  Future<TutorProfileResult> getTutorProfile({String? visitedUserId});

  /// Get a filtered lessons_list of tutors
  Future<List<TutorSearchEntry>> getTutorsList(TutorSearchFilters filters);

  /// Get tutor banking details
  Future<TutorBankingDetailsResult> getTutorBankingDetails();

  /// Edit tutor banking details
  Future<void> editTutorBankingDetails(TutorBankingDetailsPayload payload);

  /// Get editable user data
  Future<UpdatedProfileDataResult> getEditProfileData();

  /// Edit user profile data
  Future<void> editProfileData(UpdatedProfileDataPayload payload);
}
