import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/main/view_navigation_provider.dart';

class AppBottomBar extends ConsumerWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final currentIndex = ref.watch(bottomNavProvider);
    final translations = LocalisationStrings.of(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.darkPrimaryColor,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index != currentIndex) {
          ref.read(bottomNavProvider.notifier).state = index;

          // Navigate based on the index
          String route = AppRoutes.home;
          if (index == 0) {
            route = authState.isAuthorized
                ? AppRoutes.profile
                : AppRoutes.home;
          }
          if (index == 1) route = AppRoutes.tutorSearch;
          if (index == 2 && authState.isAuthorized) {
            route = AppRoutes.lessonList;
          }

          // Navigate and clear stack
          bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
            route,
            (route) => false,
          );
        }
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: translations!.bottomNavHome),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: translations.bottomNavSearch),
        if (authState.isAuthorized)
          BottomNavigationBarItem(
              icon: Icon(Icons.play_lesson), label: translations.lessons),
      ],
    );
  }
}
