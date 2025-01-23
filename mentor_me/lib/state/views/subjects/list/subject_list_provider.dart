import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/state/views/subjects/list/subject_list_state.dart';

final subjectListProvider =
    StateNotifierProvider<SubjectListNotifier, SubjectListState>((ref) {
  return SubjectListNotifier(ref);
});

class SubjectListNotifier extends StateNotifier<SubjectListState> {
  final Ref _ref;
  final AppLogger _logger;

  SubjectListNotifier(this._ref)
      : _logger = AppLogger(),
        super(SubjectListState.initial());

  Future<void> fetchSubjects() async {
    state = SubjectListState.loading();
    try {
      final subjectService = _ref.read(mentorMeApiProvider).subjectService;
      final List<SubjectListEntry> result =
          await subjectService.getSubjectsList();
      state = SubjectListState.data(result);
    } catch (e, st) {
      _logger.logError("Error fetching subjects: $e, $st");
      state = SubjectListState.error("Failed to fetch subjects");
    }
  }
}
