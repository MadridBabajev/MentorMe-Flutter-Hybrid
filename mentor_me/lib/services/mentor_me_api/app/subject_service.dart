import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/subject_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/base_service.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/request/subject_action_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/response/subject_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/response/subject_name_list_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';

class SubjectService extends BaseService implements SubjectServiceContract {
  SubjectService({
    required super.logger,
    required super.secureStorageManager,
    required super.baseUrl,
  });

  @override
  Future<List<SubjectListEntry>> getSubjectsList() async {
    try {
      final response = await dio.get(RestEndpoints.getSubjectsList);
      if (response.statusCode == 200) {
        final rawList = response.data as List;
        final subjects = rawList
            .map((json) =>
                SubjectListEntry.fromJson(json as Map<String, dynamic>))
            .toList();
        return subjects;
      } else {
        throw Exception('Failed to fetch subjects');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching subjects: $e');
      rethrow;
    }
  }

  @override
  Future<SubjectDetailsResult> getSubjectDetails(String subjectId) async {
    try {
      final response =
          await dio.get('${RestEndpoints.getSubjectDetails}/$subjectId');
      if (response.statusCode == 200) {
        return SubjectDetailsResult.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch subject details');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching subject details: $e');
      rethrow;
    }
  }

  @override
  Future<List<SubjectNameEntry>> getSubjectsNamesList() async {
    try {
      final response = await dio.get(RestEndpoints.getSubjectsNamesList);
      if (response.statusCode == 200) {
        final subjectNames =
            SubjectNameListResult.fromJson(response.data).subjectsList;
        return subjectNames ?? [];
      } else {
        throw Exception('Failed to fetch subject filters');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching subject filters: $e');
      rethrow;
    }
  }

  @override
  Future<void> addRemoveSubject(SubjectActionPayload payload) async {
    try {
      final response = await dio.put(
        RestEndpoints.performSubjectAction,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add/remove subject');
      }
    } catch (e) {
      serviceLogger.logError('Error adding/removing subject: $e');
      rethrow;
    }
  }
}
