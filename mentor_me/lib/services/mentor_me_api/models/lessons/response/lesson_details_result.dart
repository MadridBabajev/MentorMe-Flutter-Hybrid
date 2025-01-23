import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/lesson_states.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_tag.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/lesson_payment_method.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/profile_card_data.dart';

part 'lesson_details_result.freezed.dart';
part 'lesson_details_result.g.dart';

@freezed
class LessonDetailsResult with _$LessonDetailsResult {
  const factory LessonDetailsResult({
    required String id,
    required String paymentId,
    required DateTime startTime,
    required DateTime endTime,
    required LessonStates lessonState,
    required double price,
    required bool viewedByTutor,
    required bool userCanWriteReview,
    required LessonPaymentMethod studentPaymentMethod,
    required SubjectListEntry subject,
    required ProfileCardData lessonStudent,
    required ProfileCardData lessonTutor,
    required List<LessonTag> tags,
  }) = _LessonDetailsResult;

  factory LessonDetailsResult.fromJson(Map<String, dynamic> json)
    => _$LessonDetailsResultFromJson(json);
}
