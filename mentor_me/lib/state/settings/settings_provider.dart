import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/secure_storage_keys.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/secure_storage/secure_storage_manager.dart';
import 'package:mentor_me/state/settings/settings_state.dart';
import 'package:mentor_me/state/theme/theme_provider.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier(ref);
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  final Ref _ref;
  final AppLogger _logger;

  SettingsNotifier(this._ref)
      : _logger = AppLogger(),
        super(const SettingsState()) {
    _loadFromStorage();
  }

  /// Load preferences from secure storage on init
  Future<void> _loadFromStorage() async {
    final storage = _ref.read(secureStorageManagerProvider);

    try {
      final savedTheme = await storage.read(SecureStorageKeys.themeMode);
      final savedLocale = await storage.read(SecureStorageKeys.localeKey);

      bool darkMode = false;
      if (savedTheme == 'dark') {
        darkMode = true;
      }

      // If no locale saved, default to 'en'
      final locale = savedLocale ?? 'en';

      // Update our local state
      state = state.copyWith(
        isDarkMode: darkMode,
        locale: locale,
      );

      // Also set the theme provider accordingly
      if (darkMode) {
        _ref.read(themeProvider.notifier).setDarkTheme();
      } else {
        _ref.read(themeProvider.notifier).setLightTheme();
      }

      _logger.logInfo(
          "Loaded settings from secure storage. Theme=$savedTheme, Locale=$savedLocale");
    } catch (e) {
      _logger.logError("Error loading settings from storage: $e");
    }
  }

  /// Toggle the theme and save to storage
  Future<void> toggleTheme() async {
    final newValue = !state.isDarkMode;
    state = state.copyWith(isDarkMode: newValue);

    // Update theme provider
    if (newValue) {
      _ref.read(themeProvider.notifier).setDarkTheme();
    } else {
      _ref.read(themeProvider.notifier).setLightTheme();
    }

    // Save to secure storage
    final storage = _ref.read(secureStorageManagerProvider);
    await storage.write(
        SecureStorageKeys.themeMode, newValue ? 'dark' : 'light');
  }

  /// Set the locale ("en", "et"...) and save to storage
  Future<void> setLocale(String newLocale) async {
    state = state.copyWith(locale: newLocale);

    final storage = _ref.read(secureStorageManagerProvider);
    await storage.write(SecureStorageKeys.localeKey, newLocale);
  }
}
