import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/common/enums/lesson_states.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/lesson_list_entry.dart';
import 'package:mentor_me/state/views/lessons/list/lesson_list_provider.dart';
import 'package:mentor_me/state/views/lessons/list/lesson_list_state.dart';

class LessonsListView extends ConsumerStatefulWidget {
  const LessonsListView({super.key});

  @override
  ConsumerState<LessonsListView> createState() => _LessonsListViewState();
}

class _LessonsListViewState extends ConsumerState<LessonsListView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => ref.read(lessonListProvider.notifier).fetchLessons());
  }

  @override
  Widget build(BuildContext context) {
    final lessonListState = ref.watch(lessonListProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations!.lessonListTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.lightPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildContent(lessonListState),
      ),
    );
  }

  Widget _buildContent(LessonListState state) {
    final translations = LocalisationStrings.of(context);

    switch (state.status) {
      case LessonListStatus.initial:
        return Center(child: Text(translations!.lessonListNotAvailable));

      case LessonListStatus.loading:
        return const Center(child: LoadingAnimationView());

      case LessonListStatus.data:
        if (state.lessons.isEmpty) {
          return Center(
            child: Text(translations!.lessonListNoneFound),
          );
        }
        return _buildLessonList(state.lessons);

      case LessonListStatus.error:
        return const Center(child: ErrorAnimationView());
    }
  }

  Widget _buildLessonList(List<LessonListEntry> lessons) {
    return ListView.separated(
      itemCount: lessons.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return _buildLessonCard(context, lesson);
      },
    );
  }

  Widget _buildLessonCard(BuildContext context, LessonListEntry lesson) {
    final Color stateColor = _getLessonStateColor(lesson.lessonState);
    final format = 'MMM d, hh:mm a';
    final String startTimeStr = DateFormat(format).format(lesson.startTime);
    final String endTimeStr = DateFormat(format).format(lesson.endTime);
    final translations = LocalisationStrings.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.lessonDetails,
          arguments: {NavigationArgs.lessonId: lesson.id},
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: stateColor, width: 5)),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subject, Student, Tutor row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      lesson.subjectName,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    _lessonStateText(lesson.lessonState),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: stateColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Tutor & Student names
              Row(
                children: [
                  const Icon(Icons.person,
                      size: 18, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${translations!.lessonTutor} ${lesson.tutorFullName}',
                      style: GoogleFonts.poppins(
                        color: AppColors.secondaryTextColor,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.person_outline,
                      size: 18, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${translations.lessonStudent} ${lesson.studentFullName}',
                      style: GoogleFonts.poppins(
                        color: AppColors.secondaryTextColor,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              // Times
              Row(
                children: [
                  const Icon(Icons.schedule,
                      size: 18, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${translations.lessonStart} $startTimeStr',
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.schedule_outlined,
                      size: 18, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${translations.lessonEnd} $endTimeStr',
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              // Lesson price
              Row(
                children: [
                  const Icon(Icons.attach_money,
                      size: 18, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${translations.lessonPrice} ${lesson.lessonPrice.toStringAsFixed(2)} €',
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _lessonStateText(LessonStates state) {
    final translations = LocalisationStrings.of(context);

    switch (state) {
      case LessonStates.pending:
        return translations!.lessonStatePending;
      case LessonStates.upcoming:
        return translations!.lessonStateUpcoming;
      case LessonStates.finished:
        return translations!.lessonStateFinished;
      case LessonStates.canceled:
        return translations!.lessonStateCanceled;
    }
  }

  Color _getLessonStateColor(LessonStates state) {
    switch (state) {
      case LessonStates.pending:
        return Colors.orange;
      case LessonStates.upcoming:
        return Colors.blue;
      case LessonStates.finished:
        return Colors.green;
      case LessonStates.canceled:
        return Colors.red;
    }
  }
}
