import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() => _customLightTheme();

  void setLightTheme() {
    state = _customLightTheme();
  }

  void setDarkTheme() {
    state = _customDarkTheme();
  }

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }

  // Light Theme
  ThemeData _customLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textIconsColor,
        elevation: 0,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.light().textTheme,
      ).apply(
        bodyColor: AppColors.primaryTextColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.textIconsColor,
      ),
      dividerColor: AppColors.dividerColor,
    );
  }

  // Dark Theme
  ThemeData _customDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.darkPrimaryColor,
      scaffoldBackgroundColor: AppColors.darkPrimaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkPrimaryColor,
        foregroundColor: AppColors.textIconsColor,
        elevation: 0,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: AppColors.textIconsColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.textIconsColor,
      ),
      dividerColor: AppColors.dividerColor,
    );
  }
}
