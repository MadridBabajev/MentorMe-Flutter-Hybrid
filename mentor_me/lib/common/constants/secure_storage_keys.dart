class SecureStorageKeys {
  // JWT keys
  static const String jwtToken = 'jwtToken';
  static const String refreshToken = 'refreshToken';
  static const String expiresIn = 'expiresIn';

  // App preferences
  static const String themeMode = 'themeMode'; // theme: "light" or "dark"
  static const String localeKey = 'localeKey'; // language: "en" or "et"

  const SecureStorageKeys._();
}
