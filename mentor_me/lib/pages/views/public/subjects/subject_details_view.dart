import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/response/subject_details_result.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/subjects/details/subject_details_provider.dart';
import 'package:mentor_me/state/views/subjects/details/subject_details_state.dart';

class SubjectDetailsView extends ConsumerStatefulWidget {
  const SubjectDetailsView({super.key});

  @override
  ConsumerState<SubjectDetailsView> createState() => _SubjectDetailsViewState();
}

class _SubjectDetailsViewState extends ConsumerState<SubjectDetailsView> {
  String? _subjectId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final argMap = ModalRoute.of(context)?.settings.arguments;
    if (argMap is Map && argMap[NavigationArgs.subjectId] is String) {
      _subjectId = argMap[NavigationArgs.subjectId] as String;

      Future.microtask(() {
        ref.read(subjectDetailsProvider.notifier).fetchSubjectDetails(_subjectId!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final subjectDetailsState = ref.watch(subjectDetailsProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations!.subjectDetailsTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.lightPrimaryColor,
      body: _buildContent(subjectDetailsState),
    );
  }

  Widget _buildContent(SubjectDetailsState state) {
    final translations = LocalisationStrings.of(context);
    switch (state.status) {
      case SubjectDetailsStatus.initial:
        return Center(child: Text(translations!.subjectDetailsUnavailable));

      case SubjectDetailsStatus.loading:
        return const Center(child: LoadingAnimationView());

      case SubjectDetailsStatus.data:
        final details = state.subjectDetails!;
        return _buildSubjectDetails(details);

      case SubjectDetailsStatus.error:
        return const Center(child: ErrorAnimationView());
    }
  }

  Widget _buildSubjectDetails(SubjectDetailsResult details) {
    final authState = ref.watch(authProvider);
    final isAuthorized = authState.isAuthorized;
    final translations = LocalisationStrings.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Subject image
          _buildSubjectImage(details.subjectPicture),
          const SizedBox(height: 16),

          // Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              details.name,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              details.description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.secondaryTextColor,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 16),

          // TaughtBy & LearnedBy
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    title: translations!.subjectTaughtBy,
                    value: details.taughtByPeopleCount.toString(),
                    icon: Icons.person,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildInfoCard(
                    title: translations.subjectLearnedBy,
                    value: details.learnedByPeopleCount.toString(),
                    icon: Icons.group,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Add/Remove button if authorized
          if (isAuthorized) _buildToggleButton(details),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSubjectImage(Uint8List? imageData) {
    if (imageData != null && imageData.isNotEmpty) {
      return SizedBox(
        height: 220,
        width: double.infinity,
        child: Image.memory(
          imageData,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        height: 220,
        width: double.infinity,
        color: AppColors.lightPrimaryColor,
        child: const Icon(
          Icons.book,
          size: 80,
          color: AppColors.secondaryTextColor,
        ),
      );
    }
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a round button that toggles add/remove subject, with a small animation
  Widget _buildToggleButton(SubjectDetailsResult details) {
    final bool isAdded = details.isAdded == true;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: isAdded ? Colors.green : Colors.red,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          isAdded ? Icons.check : Icons.close,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () {
          ref.read(subjectDetailsProvider.notifier).toggleSubject();
        },
      ),
    );
  }
}
