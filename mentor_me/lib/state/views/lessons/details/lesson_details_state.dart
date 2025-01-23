import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_details_result.dart';

enum LessonDetailsStatus { initial, loading, loaded, error }

class LessonPrivileges {
  final bool canCancel;
  final bool canAcceptDecline;
  final bool canAddTag;
  final bool canReview;

  LessonPrivileges({
    required this.canCancel,
    required this.canAcceptDecline,
    required this.canAddTag,
    required this.canReview,
  });
}

class LessonDetailsState {
  final LessonDetailsStatus status;
  final LessonDetailsResult? lesson;
  final LessonPrivileges? privileges;
  final String? errorMessage;

  const LessonDetailsState({
    this.status = LessonDetailsStatus.initial,
    this.lesson,
    this.privileges,
    this.errorMessage,
  });

  LessonDetailsState copyWith({
    LessonDetailsStatus? status,
    LessonDetailsResult? lesson,
    LessonPrivileges? privileges,
    String? errorMessage,
  }) {
    return LessonDetailsState(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      privileges: privileges ?? this.privileges,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
