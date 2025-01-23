class RestEndpoints {
  // == Base URL ==
  static const String hostBaseUrl = "http://10.0.2.2:8000/api/";

  // == Controllers ==
  static const String accountController = "v1/identity/account/";
  static const String profileController = "v1/profile/";
  static const String lessonsController = "v1/lessons/";
  static const String subjectsController = "v1/subjects/";
  static const String paymentMethodController = "v1/paymentMethod/";
  static const String availabilityController = "v1/availability/";

  // == Actions ==
  // Identity
  static const String refreshJwtToken = "RefreshToken";
  static const String register = "Register";
  static const String login = "Login";
  static const String logout = "Logout";

  // Lessons
  static const String getReserveLessonData = "GetReserveLessonData";
  static const String getLessonDetails = "GetLessonData";
  static const String getLessonsList = "GetLessonsList";
  static const String getLessonPayment = "GetPayment";
  static const String reserveLesson = "ReserveLesson";
  static const String leaveReview = "LeaveReview";
  static const String acceptDeclineLesson = "AcceptDeclineLesson";
  static const String cancelLesson = "CancelLesson";
  static const String addTag = "AddTag";
  static const String removeTag = "RemoveTag";

  // Subjects
  static const String getSubjectsList = "GetAllSubjects";
  static const String getSubjectDetails = "GetSubjectDetails";
  static const String getSubjectsNamesList = "GetSubjectFilters";
  static const String performSubjectAction = "AddRemoveSubject";

  // Availabilities
  static const String addAvailability = "AddAvailability";
  static const String removeAvailability = "RemoveAvailability";
  static const String getUserAvailabilities = "GetAvailabilitiesList";

  // Payment methods
  static const String addPaymentMethod = "AddPaymentMethod";
  static const String removePaymentMethod = "RemovePaymentMethod";
  static const String getPaymentMethodsList = "GetPaymentMethodsList";

  // Profile
  static const String getStudentProfile = "GetStudentProfile";
  static const String getTutorProfile = "GetTutorProfile";
  static const String getSearchedTutorsList = "GetTutorsList";
  static const String getTutorBankingDetails = "GetTutorBankingDetails";
  static const String getEditableProfileData = "GetEditProfileData";
  static const String updateBankingDetails = "EditTutorBankingDetails";
  static const String updateProfileDetails = "EditProfileData";

  const RestEndpoints._();
}

class QueryParams {
  static const String paymentMethodId = "paymentMethodId";
  static const String availabilityId = "availabilityId";
  static const String visitedUserId = "visitedUserId";
  static const String lessonId = "lessonId";
  static const String tagId = "tagId";

  const QueryParams._();
}
