import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/enums/lesson_actions.dart';
import 'package:mentor_me/common/enums/lesson_states.dart';
import 'package:mentor_me/common/enums/review_variants.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/lesson_action_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/new_tag_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/review_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_details_result.dart';
import 'package:mentor_me/state/views/lessons/details/lesson_details_state.dart';

final lessonDetailsProvider =
    StateNotifierProvider<LessonDetailsNotifier, LessonDetailsState>((ref) {
  return LessonDetailsNotifier(ref);
});

class LessonDetailsNotifier extends StateNotifier<LessonDetailsState> {
  final Ref ref;
  final AppLogger _logger;

  LessonDetailsNotifier(this.ref)
      : _logger = AppLogger(),
        super(const LessonDetailsState());

  Future<void> fetchLessonDetails(String lessonId) async {
    state =
        state.copyWith(status: LessonDetailsStatus.loading, errorMessage: null);

    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      final details = await lessonService.getLessonDetails(lessonId);

      // Compute privileges after data is fetched
      final privileges = _computePrivileges(details);

      state = state.copyWith(
        status: LessonDetailsStatus.loaded,
        lesson: details,
        privileges: privileges,
        errorMessage: null,
      );
      _logger.logInfo("Fetched lesson details: $details");
      _logger.logInfo("Privileges: $privileges");
    } catch (e, st) {
      _logger.logError("Error fetching lesson details: $e\n$st");
      state = state.copyWith(
        status: LessonDetailsStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  LessonPrivileges _computePrivileges(LessonDetailsResult lesson) {
    final isUserTutor = lesson.viewedByTutor;
    final stateValue = lesson.lessonState;

    final canCancel = (stateValue == LessonStates.upcoming);
    final canAcceptDecline =
        (isUserTutor && stateValue == LessonStates.pending);
    final canAddTag = (isUserTutor &&
        (stateValue == LessonStates.upcoming ||
            stateValue == LessonStates.finished));
    final canReview =
        (stateValue == LessonStates.finished && lesson.userCanWriteReview);

    return LessonPrivileges(
      canCancel: canCancel,
      canAcceptDecline: canAcceptDecline,
      canAddTag: canAddTag,
      canReview: canReview,
    );
  }

  /// Handle accept/decline from the tutor
  Future<void> acceptOrDeclineLesson(String lessonId, bool accept) async {
    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      final decision = accept ? LessonActions.accept : LessonActions.decline;

      final payload = LessonActionPayload(
        lessonId: lessonId,
        lessonAction: decision,
      );

      await lessonService.acceptDeclineLesson(payload);

      // Refresh the lesson data
      await fetchLessonDetails(lessonId);
    } catch (e, st) {
      _logger.logError("Error accepting/declining lesson: $e\n$st");
      _setError(e.toString());
    }
  }

  Future<void> cancelLesson(String lessonId) async {
    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      await lessonService.cancelLesson(lessonId);

      // Refresh
      await fetchLessonDetails(lessonId);
    } catch (e, st) {
      _logger.logError("Error canceling lesson: $e\n$st");
      _setError(e.toString());
    }
  }

  Future<void> addTagToLesson({
    required String lessonId,
    required String tagName,
    required String tagDescription,
  }) async {
    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;

      final requestBody = NewTagPayload(
        lessonId: lessonId,
        name: tagName,
        description: tagDescription,
      );
      await lessonService.addTag(requestBody);

      // Refresh
      await fetchLessonDetails(lessonId);
    } catch (e, st) {
      _logger.logError("Error adding tag: $e\n$st");
      _setError(e.toString());
    }
  }

  Future<void> removeTagFromLesson({
    required String lessonId,
    required String tagId,
  }) async {
    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      await lessonService.removeTag(tagId);

      // Refresh
      await fetchLessonDetails(lessonId);
    } catch (e, st) {
      _logger.logError("Error removing tag: $e\n$st");
      _setError(e.toString());
    }
  }

  Future<void> leaveReview({
    required String lessonId,
    required String tutorId,
    required String studentId,
    required ReviewVariants reviewType,
    required int rating,
    required String comment,
  }) async {
    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      final payload = ReviewPayload(
        lessonId: lessonId,
        tutorId: tutorId,
        studentId: studentId,
        reviewType: reviewType,
        rating: rating,
        comment: comment,
      );

      await lessonService.leaveReview(payload);

      // Refresh
      await fetchLessonDetails(lessonId);
    } catch (e, st) {
      _logger.logError("Error leaving review: $e\n$st");
      _setError(e.toString());
    }
  }

  void _setError(String message) {
    state = state.copyWith(
      status: LessonDetailsStatus.error,
      errorMessage: message,
    );
  }
}
