import 'package:flutter/material.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/modals/base_alert_dialog.dart';

class LogoutDialog extends BaseAlertDialog<bool> {
  const LogoutDialog._({
    required super.title,
    required super.message,
    required super.buttons,
  });

  factory LogoutDialog(BuildContext context) {
    final translations = LocalisationStrings.of(context)!;
    return LogoutDialog._(
      title: translations.logout,
      message: translations.logoutConfirmation,
      buttons: {
        translations.cancel: false,
        translations.logout: true,
      },
    );
  }
}
