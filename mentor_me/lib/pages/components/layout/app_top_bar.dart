import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/modals/base_alert_dialog.dart';
import 'package:mentor_me/pages/components/modals/logout_dialog.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/main/view_navigation_provider.dart';

class AppTopBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const AppTopBar({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return AppBar(
      title: Text(title),
      actions: authState.isAuthorized
          ? [
              const InboxButton(),
              const LogoutButton(),
              const SettingsButton(),
            ]
          : [
              const SignInButton(),
              const SettingsButton(),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () async {
        final shouldLogOut = await LogoutDialog(context).present(context).then(
              (value) => value ?? false,
            );

        if (shouldLogOut) {
          bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.home,
            (route) => false,
          );
          await ref.read(authProvider.notifier).logout();
        }
      },
    );
  }
}

class InboxButton extends StatelessWidget {
  const InboxButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.mail_rounded),
        onPressed: () {
          bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.inbox,
            (route) => false,
          );
        });
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.settings,
          (route) => false,
        );
      },
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = LocalisationStrings.of(context);

    return TextButton(
      onPressed: () {
        bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.authorization,
          (route) => false,
        );
      },
      child: Text(
        translations!.signIn,
        style: TextStyle(color: AppColors.textIconsColor),
      ),
    );
  }
}
