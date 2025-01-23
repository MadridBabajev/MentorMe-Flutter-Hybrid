import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/lesson_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/base_service.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_id.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/lesson_action_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/new_tag_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/reserve_lesson_request_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/review_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_payment.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_reservation_options.dart';

class LessonService extends BaseService implements LessonServiceContract {
  LessonService({
    required super.logger,
    required super.secureStorageManager,
    required super.baseUrl,
  });

  @override
  Future<LessonReservationOptions> getReserveLessonData(String tutorId) async {
    try {
      final response = await dio.post(
        RestEndpoints.getReserveLessonData,
        data: {QueryParams.visitedUserId: tutorId},
      );
      if (response.statusCode == 200) {
        return LessonReservationOptions.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch reservation options');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching reservation options: $e');
      rethrow;
    }
  }

  @override
  Future<LessonId> reserveLesson(ReserveLessonRequestPayload payload) async {
    try {
      serviceLogger.logInfo("Payload for lesson reservation: $payload");
      final response = await dio.post(
        RestEndpoints.reserveLesson,
        data: payload.toJson(),
      );
      if (response.statusCode == 200) {
        return LessonId.fromJson(response.data);
      } else {
        throw Exception('Failed to reserve lesson');
      }
    } catch (e) {
      serviceLogger.logError('Error reserving lesson: $e');
      rethrow;
    }
  }

  @override
  Future<LessonDetailsResult> getLessonDetails(String lessonId) async {
    try {
      final response =
          await dio.get('${RestEndpoints.getLessonDetails}/$lessonId');
      if (response.statusCode == 200) {
        return LessonDetailsResult.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch lesson details');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching lesson details: $e');
      rethrow;
    }
  }

  @override
  Future<List<LessonListEntry>> getLessonsList() async {
    try {
      final response = await dio.get(RestEndpoints.getLessonsList);
      if (response.statusCode == 200) {
        final rawList = response.data as List;
        final lessons = rawList
            .map((json) => LessonListEntry.fromJson(json as Map<String, dynamic>))
            .toList();
        return lessons;
      } else {
        throw Exception('Failed to fetch lessons lessons_list');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching lessons lessons_list: $e');
      rethrow;
    }
  }

  @override
  Future<void> leaveReview(ReviewPayload payload) async {
    try {
      final response = await dio.post(
        RestEndpoints.leaveReview,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to leave review');
      }
    } catch (e) {
      serviceLogger.logError('Error leaving review: $e');
      rethrow;
    }
  }

  @override
  Future<void> addTag(NewTagPayload tag) async {
    try {
      final response = await dio.post(
        RestEndpoints.addTag,
        data: tag.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add tag');
      }
    } catch (e) {
      serviceLogger.logError('Error adding tag: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeTag(String tagId) async {
    try {
      final response = await dio.delete(
        RestEndpoints.removeTag,
        queryParameters: {QueryParams.tagId: tagId},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to remove tag');
      }
    } catch (e) {
      serviceLogger.logError('Error removing tag: $e');
      rethrow;
    }
  }

  @override
  Future<void> cancelLesson(String lessonId) async {
    try {
      final response = await dio.put(
        RestEndpoints.cancelLesson,
        data: {QueryParams.lessonId: lessonId},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to cancel lesson');
      }
    } catch (e) {
      serviceLogger.logError('Error canceling lesson: $e');
      rethrow;
    }
  }

  @override
  Future<void> acceptDeclineLesson(LessonActionPayload payload) async {
    try {
      final response = await dio.put(
        RestEndpoints.acceptDeclineLesson,
        data: payload.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to accept/decline lesson');
      }
    } catch (e) {
      serviceLogger.logError('Error accepting/declining lesson: $e');
      rethrow;
    }
  }

  @override
  Future<LessonPayment> getPaymentData(String paymentId) async {
    try {
      final response =
          await dio.get('${RestEndpoints.getLessonPayment}/$paymentId');
      if (response.statusCode == 200) {
        return LessonPayment.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch payment data');
      }
    } catch (e) {
      serviceLogger.logError('Error fetching payment data: $e');
      rethrow;
    }
  }
}
