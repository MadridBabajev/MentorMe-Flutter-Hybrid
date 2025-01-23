import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/assets_paths.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/main/view_navigation_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final translations = LocalisationStrings.of(context);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage(AssetsPaths.logo),
                ),
                const SizedBox(height: 8),
                Text(
                  translations!.drawerWelcome,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (authState.isAuthorized) ...[
                  DrawerTile(translations.drawerProfile, Icons.account_circle,
                      AppRoutes.profile),
                  DrawerTile(translations.drawerInbox, Icons.mail_rounded,
                      AppRoutes.inbox),
                  DrawerTile(
                      translations.lessons, Icons.play_lesson, AppRoutes.lessonList),
                  const Divider(),
                ],
                DrawerTile(translations.drawerSubjects, Icons.menu_book_rounded,
                    AppRoutes.subjectList),
                DrawerTile(translations.drawerTutorSearch, Icons.search,
                    AppRoutes.tutorSearch),
                const Divider(),
                DrawerTile(translations.drawerAbout, Icons.info, AppRoutes.home),
              ],
            ),
          ),
          if (authState.isAuthorized)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () => ref.read(authProvider.notifier).logout(),
                icon: const Icon(Icons.logout),
                label: Text(translations.logout),
              ),
            ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const DrawerTile(this.title, this.icon, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop(); // Close the drawer
        bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
          route,
          (route) => false,
        );
      },
    );
  }
}
