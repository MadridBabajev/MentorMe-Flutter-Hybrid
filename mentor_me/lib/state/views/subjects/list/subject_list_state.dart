import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';

enum SubjectListStatus { initial, loading, data, error }

class SubjectListState {
  final SubjectListStatus status;
  final List<SubjectListEntry> subjects;
  final String? errorMessage;

  const SubjectListState._({
    required this.status,
    required this.subjects,
    this.errorMessage,
  });

  factory SubjectListState.initial() => const SubjectListState._(
        status: SubjectListStatus.initial,
        subjects: [],
      );

  factory SubjectListState.loading() => const SubjectListState._(
        status: SubjectListStatus.loading,
        subjects: [],
      );

  factory SubjectListState.data(List<SubjectListEntry> subjects) =>
      SubjectListState._(
        status: SubjectListStatus.data,
        subjects: subjects,
      );

  factory SubjectListState.error(String message) => SubjectListState._(
        status: SubjectListStatus.error,
        subjects: [],
        errorMessage: message,
      );
}
