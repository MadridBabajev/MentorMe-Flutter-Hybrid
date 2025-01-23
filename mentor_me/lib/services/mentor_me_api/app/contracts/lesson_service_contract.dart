import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_id.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/lesson_action_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/new_tag_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/reserve_lesson_request_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/review_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_payment.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_reservation_options.dart';

abstract class LessonServiceContract {
  /// Fetch reservation options for a specific tutor
  Future<LessonReservationOptions> getReserveLessonData(String tutorId);

  /// Reserve a lesson
  Future<LessonId> reserveLesson(ReserveLessonRequestPayload payload);

  /// Get details of a specific lesson
  Future<LessonDetailsResult> getLessonDetails(String lessonId);

  /// Fetch the lessons_list of lessons for the user
  Future<List<LessonListEntry>> getLessonsList();

  /// Leave a review for a completed lesson
  Future<void> leaveReview(ReviewPayload payload);

  /// Add a new tag to a lesson
  Future<void> addTag(NewTagPayload tag);

  /// Remove a tag from a lesson
  Future<void> removeTag(String tagId);

  /// Cancel a lesson
  Future<void> cancelLesson(String lessonId);

  /// Accept or decline a lesson request
  Future<void> acceptDeclineLesson(LessonActionPayload payload);

  /// Get payment data for a lesson
  Future<LessonPayment> getPaymentData(String paymentId);
}
