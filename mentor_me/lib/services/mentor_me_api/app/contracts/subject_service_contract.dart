import 'package:mentor_me/services/mentor_me_api/models/subjects/request/subject_action_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/response/subject_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';

abstract class SubjectServiceContract {
  /// Fetch all subjects
  Future<List<SubjectListEntry>> getSubjectsList();

  /// Get details of a specific subject
  Future<SubjectDetailsResult> getSubjectDetails(String subjectId);

  /// Fetch subject filters
  Future<List<SubjectNameEntry>> getSubjectsNamesList();

  /// Add or remove a subject for the user
  Future<void> addRemoveSubject(SubjectActionPayload payload);
}
