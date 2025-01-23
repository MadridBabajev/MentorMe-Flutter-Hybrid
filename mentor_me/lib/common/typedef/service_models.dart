import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/request/new_availability_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/lesson_payment_method.dart';

typedef StudentPaymentMethods = List<LessonPaymentMethod>?;

typedef TutorAvailabilities = List<NewAvailabilityPayload>?;

typedef TutorSubjects = List<SubjectNameEntry>?;

typedef SelectedTutorId = String;

typedef SelectedPaymentMethodId = String;

typedef SelectedTutorSubjectId = String;

typedef ReservedLessonsStartTime = DateTime;

typedef ReservedLessonsEndTime = DateTime;
