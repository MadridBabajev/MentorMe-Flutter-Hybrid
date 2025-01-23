import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/ui_strings.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/router.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/settings/settings_provider.dart';
import 'package:mentor_me/state/theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MentorMeApp()));
}

class MentorMeApp extends ConsumerStatefulWidget {
  const MentorMeApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MentorMeState();
}

class _MentorMeState extends ConsumerState<MentorMeApp> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      try {
        // Initialize your providers/services
        await ref.read(mentorMeApiProvider).initialize();
        await ref.read(authProvider.notifier).initializeAuth();

        AppLogger().logInfo("App initialized successfully.");
      } catch (e) {
        AppLogger().logError("Initialization error: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final settings = ref.watch(settingsProvider);

    final currentLocaleString = settings.locale;
    final Locale currentLocale = Locale(currentLocaleString);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: UiStrings.appTitle,
      theme: theme,
      routerConfig: router,

      // Use the official Flutter localizations
      localizationsDelegates: [
        LocalisationStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('et', ''),
      ],
      locale: currentLocale,
    );
  }
}
