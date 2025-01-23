import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/common/constants/language_codes.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/state/settings/settings_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(translations!.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // THEME TOGGLE
          Card(
            child: SwitchListTile(
              contentPadding: EdgeInsets.all(12),
              title: Text(
                translations.settingsDarkTheme,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              secondary: const Icon(Icons.dark_mode),
              activeColor: AppColors.primaryColor,
              value: settings.isDarkMode,
              onChanged: (_) {
                ref.read(settingsProvider.notifier).toggleTheme();
              },
            ),
          ),
          const SizedBox(height: 8),

          // LOCALE SELECTOR
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                translations.settingsLanguage,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              contentPadding: EdgeInsets.all(12),
              trailing: DropdownButton<String>(
                value: settings.locale,
                items: const [
                  DropdownMenuItem(
                    value: LanguageCodes.english,
                    child:
                        _LanguageMenuItem(flagEmoji: '🇺🇸', label: 'English'),
                  ),
                  DropdownMenuItem(
                    value: LanguageCodes.estonian,
                    child: _LanguageMenuItem(flagEmoji: '🇪🇪', label: 'Eesti'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref.read(settingsProvider.notifier).setLocale(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageMenuItem extends StatelessWidget {
  final String flagEmoji;
  final String label;

  const _LanguageMenuItem({required this.flagEmoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(flagEmoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
