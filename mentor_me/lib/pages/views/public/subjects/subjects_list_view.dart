import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_list_entry.dart';
import 'package:mentor_me/state/views/subjects/list/subject_list_provider.dart';
import 'package:mentor_me/state/views/subjects/list/subject_list_state.dart';

class SubjectsListView extends ConsumerStatefulWidget {
  const SubjectsListView({super.key});

  @override
  ConsumerState<SubjectsListView> createState() => _SubjectsListViewState();
}

class _SubjectsListViewState extends ConsumerState<SubjectsListView> {
  @override
  void initState() {
    super.initState();
    // Fetch subjects when the view first appears
    Future.microtask(() => ref.read(subjectListProvider.notifier).fetchSubjects());
  }

  @override
  Widget build(BuildContext context) {
    final subjectListState = ref.watch(subjectListProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations!.subjectsListTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.lightPrimaryColor,
      body: _buildContent(subjectListState),
    );
  }

  Widget _buildContent(SubjectListState state) {
    final translations = LocalisationStrings.of(context);

    switch (state.status) {
      case SubjectListStatus.initial:
        return Center(child: Text(translations!.subjectListNotAvailable));

      case SubjectListStatus.loading:
        return const Center(child: LoadingAnimationView());

      case SubjectListStatus.data:
        if (state.subjects.isEmpty) {
          return Center(child: Text(translations!.subjectListNoneFound));
        }
        return _buildSubjectsGrid(state.subjects);

      case SubjectListStatus.error:
        return const Center(child: ErrorAnimationView());
    }
  }

  Widget _buildSubjectsGrid(List<SubjectListEntry> subjects) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return _buildSubjectCard(subject);
      },
    );
  }

  Widget _buildSubjectCard(SubjectListEntry subject) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.subjectDetails,
          arguments: {NavigationArgs.subjectId: subject.id},
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSubjectImage(subject.subjectPicture),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subject.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectImage(Uint8List? imageData) {
    if (imageData != null && imageData.isNotEmpty) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Image.memory(
          imageData,
          fit: BoxFit.cover,
          height: 120,
        ),
      );
    } else {
      return Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: const Icon(
          Icons.book,
          size: 48,
          color: AppColors.secondaryTextColor,
        ),
      );
    }
  }
}
