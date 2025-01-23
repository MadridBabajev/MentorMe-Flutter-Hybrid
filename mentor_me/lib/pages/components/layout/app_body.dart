import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/pages/views/lessons/lesson_details_view.dart';
import 'package:mentor_me/pages/views/lessons/lesson_payment_view.dart';
import 'package:mentor_me/pages/views/lessons/lesson_reservation_view.dart';
import 'package:mentor_me/pages/views/lessons/lessons_list_view.dart';
import 'package:mentor_me/pages/views/public/authorization_view.dart';
import 'package:mentor_me/pages/views/public/home_view.dart';
import 'package:mentor_me/pages/views/public/settings_view.dart';
import 'package:mentor_me/pages/views/public/subjects/subject_details_view.dart';
import 'package:mentor_me/pages/views/public/subjects/subjects_list_view.dart';
import 'package:mentor_me/pages/views/public/tutor_search_view.dart';
import 'package:mentor_me/pages/views/user/availabilities_view.dart';
import 'package:mentor_me/pages/views/user/banking_details_view.dart';
import 'package:mentor_me/pages/views/user/inbox_view.dart';
import 'package:mentor_me/pages/views/user/payment_methods_view.dart';
import 'package:mentor_me/pages/views/user/profile_view.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/main/view_navigation_provider.dart';

class AppBody extends ConsumerWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Navigator(
      key: bodyNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        final page = {
          AppRoutes.home: HomeView(),
          AppRoutes.settings: SettingsView(),
          AppRoutes.authorization: AuthorizationView(),
          AppRoutes.tutorSearch: TutorSearchView(),
          AppRoutes.subjectList: SubjectsListView(),
          AppRoutes.subjectDetails: SubjectDetailsView(),
          AppRoutes.lessonList: authState.isAuthorized ? LessonsListView() : HomeView(),
          AppRoutes.lessonDetails: authState.isAuthorized ? LessonDetailsView() : HomeView(),
          AppRoutes.lessonPayment: authState.isAuthorized ? LessonPaymentView() : HomeView(),
          AppRoutes.lessonReservation: authState.isAuthorized ? LessonReservationView() : HomeView(),
          AppRoutes.profile: authState.isAuthorized ? ProfileView() : HomeView(),
          AppRoutes.availabilities: authState.isAuthorized ? AvailabilitiesView() : HomeView(),
          AppRoutes.paymentMethods: authState.isAuthorized ? PaymentMethodsView() : HomeView(),
          AppRoutes.bankingDetails: authState.isAuthorized ? BankingDetailsView() : HomeView(),
          AppRoutes.inbox: InboxView(),
        }[settings.name] ?? HomeView();

        return MaterialPageRoute(
          builder: (_) => page,
          settings: settings,
        );
      },
    );
  }
}
