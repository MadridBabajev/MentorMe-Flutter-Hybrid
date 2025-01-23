import 'package:flutter/material.dart';

@immutable
class AppRoutes {
  static const String home = "/";
  static const String settings = "/settings";
  static const String authorization = "/authorization";
  static const String tutorSearch = "/tutor-search";
  static const String subjectList = "/subjects";
  static const String subjectDetails = "/subjects/details";
  static const String lessonList = "/lessons";
  static const String lessonDetails = "/lessons/details";
  static const String lessonReservation = "/lessons-reservation";
  static const String lessonPayment = "/lesson-payment";
  static const String profile = "/profile";
  static const String availabilities = "/availabilities";
  static const String paymentMethods = "/payment-methods";
  static const String bankingDetails = "/banking-details";
  static const String inbox = "/inbox";

  const AppRoutes._();
}

@immutable
class NavigationArgs {
  static const String visitedUserId = "visitedUserId";
  static const String visitedUserType = "visitedUserType";
  static const String tutorId = "tutorId";
  static const String lessonId = "lessonId";
  static const String subjectId = "subjectId";

  const NavigationArgs._();
}
