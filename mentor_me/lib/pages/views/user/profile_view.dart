import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/common/constants/user_types.dart';
import 'package:mentor_me/common/extentions/extentions.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/availability_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/student_profile_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/profile/response/tutor_profile_result.dart';
import 'package:mentor_me/state/authorization/auth_provider.dart';
import 'package:mentor_me/state/views/user/profile/profile_provider.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  String? _visitedUserId;
  String? _visitedUserType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argMap = ModalRoute.of(context)?.settings.arguments;
    if (argMap is Map) {
      if (argMap[NavigationArgs.visitedUserId] is String) {
        _visitedUserId = argMap[NavigationArgs.visitedUserId] as String;
      }
      if (argMap[NavigationArgs.visitedUserType] is String) {
        _visitedUserType = argMap[NavigationArgs.visitedUserType] as String;
      }
    }
    Future.microtask(() {
      ref.read(profileProvider.notifier).fetchProfileDataFor(
          visitedUserId: _visitedUserId, visitedUserType: _visitedUserType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          translations!.profileTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          Builder(
            builder: (context) {
              final authState = ref.watch(authProvider);
              final currentUserId = authState.userId;
              if (currentUserId != null &&
                  _visitedUserId != null &&
                  _visitedUserId != currentUserId &&
                  _visitedUserType == UserTypes.tutor) {
                return IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.lessonReservation,
                      arguments: {NavigationArgs.tutorId: _visitedUserId},
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: profileState.when(
        initial: () => Center(child: Text(translations.profileNoDataAvailable)),
        loading: () => const Center(child: LoadingAnimationView()),
        tutor: (tutorProfile) => _buildTutorProfileView(tutorProfile),
        student: (studentProfile) => _buildStudentProfileView(studentProfile),
        error: (message) => const Center(child: ErrorAnimationView()),
      ),
    );
  }

  Widget _buildTutorProfileView(TutorProfileResult profile) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderSection(
            profile.firstName,
            profile.lastName,
            profile.title,
            profile.averageRating,
            profile.profilePicture,
          ),
          _buildSummaryCard(profile.balance, profile.numberOfClasses),
          const SizedBox(height: 16),
          _buildSubjectsSection(profile.subjects),
          const SizedBox(height: 16),
          _buildAvailabilitiesSection(profile.availabilities),
        ],
      ),
    );
  }

  Widget _buildStudentProfileView(StudentProfileResult profile) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderSection(
            profile.firstName,
            profile.lastName,
            profile.title,
            profile.averageRating,
            profile.profilePicture,
          ),
          _buildSummaryCard(profile.balance, profile.numberOfClasses),
          const SizedBox(height: 16),
          _buildSubjectsSection(profile.subjects),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(
    String firstName,
    String lastName,
    String title,
    double rating,
    Uint8List? profilePicture,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        gradient: const LinearGradient(
          colors: [AppColors.primaryColor, AppColors.darkPrimaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                profilePicture != null ? MemoryImage(profilePicture) : null,
            backgroundColor: AppColors.lightPrimaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            "$firstName $lastName",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textIconsColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.textIconsColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: AppColors.accentColor, size: 20),
              const SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textIconsColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(double balance, int numberOfClasses) {
    final translations = LocalisationStrings.of(context);

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSummaryTile(translations!.profileBalance, "${balance.toStringAsFixed(2)} €"),
            _buildSummaryTile(translations.profileClasses, numberOfClasses.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryTile(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectsSection(List<SubjectListEntry>? subjects) {
    final translations = LocalisationStrings.of(context);

    if (subjects == null || subjects.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          translations!.profileNoSubjectsAvailable,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColors.primaryTextColor,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            translations!.profileSubjects,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children:
                subjects.map((subject) => _buildSubjectCard(subject)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectCard(SubjectListEntry subject) {
    return SizedBox(
      width: 120,
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: subject.subjectPicture != null
                  ? ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.memory(
                        subject.subjectPicture!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      color: AppColors.lightPrimaryColor,
                      child: const Icon(Icons.book, size: 40),
                    ),
            ),
            // Name container
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subject.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilitiesSection(List<AvailabilityEntry>? availabilities) {
    final translations = LocalisationStrings.of(context);

    if (availabilities == null || availabilities.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          translations!.profileNoAvailabilities,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColors.primaryTextColor,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translations!.profileAvailabilities,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: availabilities.map((availability) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(Icons.access_time,
                      color: AppColors.darkPrimaryColor),
                  title: Text(
                    availability.dayOfTheWeek.name.capitalize(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  subtitle: Text(
                    "${availability.fromHours} - ${availability.toHours}",
                    style: GoogleFonts.poppins(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
