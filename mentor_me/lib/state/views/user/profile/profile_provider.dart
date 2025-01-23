import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/user_types.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/user/profile/profile_state.dart';

final profileProvider =
    StateNotifierProvider<ProfileStateNotifier, ProfileState>((ref) {
  return ProfileStateNotifier(ref);
});

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  final Ref ref;
  final AppLogger _logger;

  ProfileStateNotifier(this.ref)
      : _logger = AppLogger(),
        super(ProfileState.initial());

  Future<void> fetchProfileDataFor({String? visitedUserId,
    String? visitedUserType,
  }) async {
    state = ProfileState.loading();
    try {
      final profileService = ref.read(mentorMeApiProvider).profileService;
      if (visitedUserId != null && visitedUserType != null) {
        if (visitedUserType == UserTypes.tutor) {
          final tutorProfile = await profileService.getTutorProfile(
            visitedUserId: visitedUserId,
          );
          state = ProfileState.tutor(tutorProfile);
        } else if (visitedUserType == UserTypes.student) {
          final studentProfile = await profileService.getStudentProfile(
            visitedUserId: visitedUserId,
          );
          state = ProfileState.student(studentProfile);
        } else {
          throw Exception("Unsupported visitedUserType: $visitedUserType");
        }
      } else {
        final authState = ref.read(authProvider);
        final userType = authState.userType;
        if (userType == UserTypes.tutor) {
          final tutorProfile = await profileService.getTutorProfile();
          state = ProfileState.tutor(tutorProfile);
        } else if (userType == UserTypes.student) {
          final studentProfile = await profileService.getStudentProfile();
          state = ProfileState.student(studentProfile);
        } else {
          throw Exception("Invalid user type");
        }
      }
    } catch (e) {
      state = ProfileState.error("Failed to fetch profile data: $e");
      _logger.logError("Failed to fetch profile data: $e");
    }
  }
}
