import 'package:mentor_me/services/mentor_me_api/models/subjects/response/subject_details_result.dart';

enum SubjectDetailsStatus { initial, loading, data, error }

class SubjectDetailsState {
  final SubjectDetailsStatus status;
  final SubjectDetailsResult? subjectDetails;
  final String? errorMessage;

  const SubjectDetailsState._({
    required this.status,
    this.subjectDetails,
    this.errorMessage,
  });

  factory SubjectDetailsState.initial() => const SubjectDetailsState._(
    status: SubjectDetailsStatus.initial,
  );

  factory SubjectDetailsState.loading() => const SubjectDetailsState._(
    status: SubjectDetailsStatus.loading,
  );

  factory SubjectDetailsState.data(SubjectDetailsResult subjectDetails) =>
      SubjectDetailsState._(
        status: SubjectDetailsStatus.data,
        subjectDetails: subjectDetails,
      );

  factory SubjectDetailsState.error(String message) => SubjectDetailsState._(
    status: SubjectDetailsStatus.error,
    errorMessage: message,
  );
}