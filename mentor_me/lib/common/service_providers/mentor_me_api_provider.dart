import 'package:mentor_me/common/constants/rest_endpoints.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/secure_storage/secure_storage_manager.dart';
import 'package:mentor_me/services/mentor_me_api/app/availability_service.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/availability_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/identity_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/lesson_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/payment_method_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/profile_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/app/contracts/subject_service_contract.dart';
import 'package:mentor_me/services/mentor_me_api/app/identity_service.dart';
import 'package:mentor_me/services/mentor_me_api/app/lesson_services.dart';
import 'package:mentor_me/services/mentor_me_api/app/payment_method_service.dart';
import 'package:mentor_me/services/mentor_me_api/app/profile_service.dart';
import 'package:mentor_me/services/mentor_me_api/app/subject_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final mentorMeApiProvider = Provider<MentorMeApiProvider>((ref) {
  return MentorMeApiProvider();
});

class MentorMeApiProvider {
  // Singleton boilerplate
  factory MentorMeApiProvider() => _instance;
  static final MentorMeApiProvider _instance = MentorMeApiProvider._internal();
  MentorMeApiProvider._internal();

  // Shared core components
  late final AppLogger logger;
  late final SecureStorageManager secureStorageManager;

  // Services
  late final IdentityServiceContract identityService;
  late final LessonServiceContract lessonService;
  late final PaymentMethodServiceContract paymentMethodService;
  late final ProfileServiceContract profileService;
  late final SubjectServiceContract subjectService;
  late final AvailabilityServiceContract availabilityService;

  Future<void> initialize() async {
    logger = AppLogger();
    secureStorageManager = SecureStorageManager();

    // Initialize all services
    identityService = IdentityService(
      logger: logger,
      secureStorageManager: secureStorageManager,
      baseUrl: RestEndpoints.hostBaseUrl + RestEndpoints.accountController,
    );

    lessonService = LessonService(
      logger: logger,
      secureStorageManager: secureStorageManager,
      baseUrl: RestEndpoints.hostBaseUrl + RestEndpoints.lessonsController,
    );

    paymentMethodService = PaymentMethodService(
      logger: logger,
      secureStorageManager: secureStorageManager,
      baseUrl: RestEndpoints.hostBaseUrl + RestEndpoints.paymentMethodController,
    );

    profileService = ProfileService(
      logger: logger,
      secureStorageManager: secureStorageManager,
      baseUrl: RestEndpoints.hostBaseUrl + RestEndpoints.profileController,
    );

    subjectService = SubjectService(
      logger: logger,
      secureStorageManager: secureStorageManager,
      baseUrl: RestEndpoints.hostBaseUrl + RestEndpoints.subjectsController,
    );

    availabilityService = AvailabilityService(
      logger: logger,
      secureStorageManager: secureStorageManager,
      baseUrl: RestEndpoints.hostBaseUrl + RestEndpoints.availabilityController,
    );

    logger.logInfo("MentorMeApiProvider initialized successfully.");
  }
}
