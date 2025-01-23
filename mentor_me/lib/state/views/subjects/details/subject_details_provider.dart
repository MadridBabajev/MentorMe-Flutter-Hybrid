import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/enums/subject_actions.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/request/subject_action_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/response/subject_details_result.dart';
import 'package:mentor_me/state/views/subjects/details/subject_details_state.dart';

final subjectDetailsProvider =
    StateNotifierProvider<SubjectDetailsNotifier, SubjectDetailsState>((ref) {
  return SubjectDetailsNotifier(ref);
});

class SubjectDetailsNotifier extends StateNotifier<SubjectDetailsState> {
  final Ref _ref;
  final AppLogger _logger;

  SubjectDetailsNotifier(this._ref)
      : _logger = AppLogger(),
        super(SubjectDetailsState.initial());

  Future<void> fetchSubjectDetails(String subjectId) async {
    state = SubjectDetailsState.loading();
    try {
      final subjectService = _ref.read(mentorMeApiProvider).subjectService;
      final SubjectDetailsResult details =
          await subjectService.getSubjectDetails(subjectId);

      state = SubjectDetailsState.data(details);
    } catch (e, st) {
      _logger.logError("Error fetching subject details: $e\n$st");
      state = SubjectDetailsState.error("Failed to fetch subject details");
    }
  }

  Future<void> toggleSubject() async {
    final currentState = state;
    if (currentState.subjectDetails == null) {
      return;
    }

    final subjectId = currentState.subjectDetails!.id;
    final bool isAddedNow = currentState.subjectDetails!.isAdded ?? false;

    final action =
        isAddedNow ? SubjectActions.removeSubject : SubjectActions.addSubject;

    try {
      final subjectService = _ref.read(mentorMeApiProvider).subjectService;

      final payload = SubjectActionPayload(
        subjectId: subjectId,
        subjectAction: action,
      );
      await subjectService.addRemoveSubject(payload);

      final updatedDetails = currentState.subjectDetails!.copyWith(
        isAdded: !isAddedNow,
      );
      state = SubjectDetailsState.data(updatedDetails);
    } catch (e, st) {
      _logger.logError("Error toggling subject: $e\n$st");
    }
  }
}
