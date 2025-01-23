import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/student_profile_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/tutor_profile_result.dart';

enum ProfileStatus { initial, loading, tutor, student, error }

class ProfileState {
  final ProfileStatus status;
  final TutorProfileResult? tutorProfile;
  final StudentProfileResult? studentProfile;
  final String? errorMessage;

  const ProfileState._({
    required this.status,
    this.tutorProfile,
    this.studentProfile,
    this.errorMessage,
  });

  factory ProfileState.initial() => const ProfileState._(status: ProfileStatus.initial);

  factory ProfileState.loading() => const ProfileState._(status: ProfileStatus.loading);

  factory ProfileState.tutor(TutorProfileResult tutorProfile) =>
      ProfileState._(status: ProfileStatus.tutor, tutorProfile: tutorProfile);

  factory ProfileState.student(StudentProfileResult studentProfile) =>
      ProfileState._(status: ProfileStatus.student, studentProfile: studentProfile);

  factory ProfileState.error(String message) =>
      ProfileState._(status: ProfileStatus.error, errorMessage: message);

  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(TutorProfileResult) tutor,
    required T Function(StudentProfileResult) student,
    required T Function(String) error,
  }) {
    switch (status) {
      case ProfileStatus.initial:
        return initial();
      case ProfileStatus.loading:
        return loading();
      case ProfileStatus.tutor:
        return tutor(tutorProfile!);
      case ProfileStatus.student:
        return student(studentProfile!);
      case ProfileStatus.error:
        return error(errorMessage!);
    }
  }
}
