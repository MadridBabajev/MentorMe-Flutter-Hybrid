import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/common/constants/user_types.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/request/tutor_search_filters.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/tutor_search_entry.dart';
import 'package:mentor_me/state/views/user/tutor_search/tutor_search_provider.dart';
import 'package:mentor_me/state/views/user/tutor_search/tutor_search_state.dart';

class TutorSearchView extends ConsumerStatefulWidget {
  const TutorSearchView({super.key});

  @override
  ConsumerState createState() => _TutorSearchViewState();
}

class _TutorSearchViewState extends ConsumerState<TutorSearchView> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _minRateController;
  late TextEditingController _maxRateController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _minRateController = TextEditingController();
    _maxRateController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _minRateController.dispose();
    _maxRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(tutorSearchProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          translations!.tutorSearchTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Filter Fields
              Text(
                translations.filters,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              _buildFilterFields(),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Build new filters from controllers
                  final newFilters = TutorSearchFilters(
                    firstName: _firstNameController.text.isNotEmpty
                        ? _firstNameController.text
                        : null,
                    lastName: _lastNameController.text.isNotEmpty
                        ? _lastNameController.text
                        : null,
                    minHourlyRate: _minRateController.text.isNotEmpty
                        ? double.tryParse(_minRateController.text)
                        : null,
                    maxHourlyRate: _maxRateController.text.isNotEmpty
                        ? double.tryParse(_maxRateController.text)
                        : null,
                  );

                  // Update provider state & fetch
                  ref
                      .read(tutorSearchProvider.notifier)
                      .updateFilters(newFilters);
                  await ref.read(tutorSearchProvider.notifier).fetchTutors();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  translations.searchButton,
                  style: GoogleFonts.poppins(color: AppColors.textIconsColor),
                ),
              ),

              const SizedBox(height: 16),
              // Results area
              _buildResults(searchState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterFields() {
    final translations = LocalisationStrings.of(context);
    return Column(
      children: [
        _buildTextField(
          controller: _firstNameController,
          label: translations!.firstNameField,
        ),
        const SizedBox(height: 8),
        _buildTextField(
          controller: _lastNameController,
          label: translations.lastNameField,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                controller: _minRateController,
                label: translations.searchMinRate,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildTextField(
                controller: _maxRateController,
                label: translations.searchMaxRate,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style:
          GoogleFonts.poppins(fontSize: 14, color: AppColors.primaryTextColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: AppColors.secondaryTextColor),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.darkPrimaryColor),
        ),
      ),
    );
  }

  Widget _buildResults(tutorSearchState) {
    final translations = LocalisationStrings.of(context);

    switch (tutorSearchState.status) {
      case TutorSearchStatus.initial:
        return const SizedBox.shrink();
      case TutorSearchStatus.loading:
        return const Center(child: LoadingAnimationView());
      case TutorSearchStatus.error:
        return Column(
          children: [
            Text(
              "${translations!.errorLabel} ${tutorSearchState.errorMessage}",
              style: GoogleFonts.poppins(color: AppColors.errorColor),
            ),
            const SizedBox(height: 8),
            const ErrorAnimationView(),
          ],
        );
      case TutorSearchStatus.loaded:
        final tutors = tutorSearchState.results;
        if (tutors.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              translations!.noTutorsFound,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.primaryTextColor,
              ),
            ),
          );
        }
        // Show the list of tutors
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              translations!.results,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              itemCount: tutors.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final tutor = tutors[index];
                return _buildTutorCard(tutor);
              },
            ),
          ],
        );
    }
    return Column(
      children: [
        Text(
          translations!.errorFetchingTutors,
          style: GoogleFonts.poppins(color: AppColors.errorColor),
        ),
        const SizedBox(height: 8),
        const ErrorAnimationView(),
      ],
    );
  }

  Widget _buildTutorCard(TutorSearchEntry tutor) {
    final translations = LocalisationStrings.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // Navigate to ProfileView with visitedUserId
          Navigator.of(context).pushNamed(
            AppRoutes.profile,
            arguments: {
              NavigationArgs.visitedUserId: tutor.id,
              NavigationArgs.visitedUserType: UserTypes.tutor,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: tutor.profilePicture != null
                    ? MemoryImage(tutor.profilePicture as Uint8List)
                    : null,
                backgroundColor: AppColors.lightPrimaryColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${tutor.firstName} ${tutor.lastName}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tutor.title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: AppColors.accentColor, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          tutor.averageRating.toStringAsFixed(1),
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "\$${tutor.hourlyRate.toStringAsFixed(2)}/hr",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${translations!.classesTutoredLabel} ${tutor.classesTutored}",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
