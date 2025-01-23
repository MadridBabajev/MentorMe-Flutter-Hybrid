import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/assets_paths.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/state/views/main/view_navigation_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = LocalisationStrings.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.textIconsColor,
            AppColors.lightPrimaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  AssetsPaths.logo,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              translations!.homeWelcomeTitle,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              translations.homeWelcomeDescription,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(height: 24),

            // Example Card 1
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.search, color: AppColors.accentColor),
                title: Text(
                  // If you have "homeTutorsTitle" in your arb, use localizations.homeTutorsTitle
                  // Otherwise create a new key or rename your ARB keys accordingly
                  translations.homeTutorsTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(translations.homeTutorsDescription),
              ),
            ),

            // Example Card 2
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading:
                    Icon(Icons.calendar_today, color: AppColors.accentColor),
                title: Text(
                  translations.homeReservationTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(translations.homeReservationDescription),
              ),
            ),

            // Example Card 3
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.star, color: AppColors.accentColor),
                title: Text(
                  translations.homeReviewTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(translations.homeReviewDescription),
              ),
            ),
            const SizedBox(height: 24),

            // "Get Started" button
            ElevatedButton(
              onPressed: () {
                bodyNavigatorKey.currentState?.pushNamedAndRemoveUntil(
                  AppRoutes.tutorSearch,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text(
                // If you have a 'homeGetStarted' in your ARB, use `localizations.homeGetStarted`
                translations.homeGetStarted,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
