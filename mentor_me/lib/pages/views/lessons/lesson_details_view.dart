import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/common/enums/lesson_states.dart';
import 'package:mentor_me/common/enums/review_variants.dart';
import 'package:mentor_me/common/extentions/extentions.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/pages/components/modals/lesson_modals.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_details_result.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_tag.dart';
import 'package:mentor_me/state/views/lessons/details/lesson_details_provider.dart';
import 'package:mentor_me/state/views/lessons/details/lesson_details_state.dart';

class LessonDetailsView extends ConsumerStatefulWidget {
  const LessonDetailsView({super.key});

  @override
  ConsumerState createState() => _LessonDetailsViewState();
}

class _LessonDetailsViewState extends ConsumerState<LessonDetailsView> {
  String? _lessonId;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map && args[NavigationArgs.lessonId] is String) {
        _lessonId = args[NavigationArgs.lessonId] as String;
        // Fetch data
        Future.microtask(() {
          ref.read(lessonDetailsProvider.notifier).fetchLessonDetails(_lessonId!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsState = ref.watch(lessonDetailsProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          translations!.lessonDetailsTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: _buildContent(detailsState),
    );
  }

  Widget _buildContent(LessonDetailsState state) {
    final translations = LocalisationStrings.of(context);

    switch (state.status) {
      case LessonDetailsStatus.initial:
      case LessonDetailsStatus.loading:
        return const Center(child: LoadingAnimationView());

      case LessonDetailsStatus.error:
        return _buildErrorState(state.errorMessage);

      case LessonDetailsStatus.loaded:
        if (state.lesson == null) {
          return _buildErrorState(translations!.lessonNoDataError);
        }
        return _buildLessonDetails(state.lesson!, state.privileges);
    }
  }

  Widget _buildErrorState(String? errorMessage) {
    final translations = LocalisationStrings.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${translations!.lessonErrorFetchingData}: ${errorMessage ?? 'Unknown'}",
          style: GoogleFonts.poppins(color: AppColors.errorColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        const ErrorAnimationView(),
      ],
    );
  }

  Widget _buildLessonDetails(LessonDetailsResult lesson, LessonPrivileges? privileges) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Main info card
          _buildLessonInfoCard(lesson),

          const SizedBox(height: 16),

          // Subject, tutor, student cards (equally sized)
          _buildThreeCardsRow(lesson),

          const SizedBox(height: 16),

          // Action buttons
          if (privileges != null) _buildActionsCard(lesson, privileges),

          const SizedBox(height: 24),

          // Tags section
          _buildTagSection(lesson, privileges),
        ],
      ),
    );
  }

  /// We copy the same color logic from the lesson list
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

  Widget _buildLessonInfoCard(LessonDetailsResult lesson) {
    final translations = LocalisationStrings.of(context);
    final lessonStateColor = _getLessonStateColor(lesson.lessonState);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translations!.lessonDetailsTitle,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 8),

          // Price + Payment
          Text(
            "${translations.lessonPrice} \$${lesson.price.toStringAsFixed(2)}",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            "${translations.lessonPaymentMethod} "
                "${lesson.studentPaymentMethod.paymentMethodType.name.capitalize()} "
                "${lesson.studentPaymentMethod.details ?? ''}",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          const SizedBox(height: 8),

          // Lesson State (use the color)
          Text(
            "${translations.lessonState} ${lesson.lessonState.name.capitalize()}",
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: lessonStateColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),

          // Start/End times
          Text(
            "${translations.lessonStart} ${_formatDate(lesson.startTime)}",
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          Text(
            "${translations.lessonEnd} ${_formatDate(lesson.endTime)}",
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildThreeCardsRow(LessonDetailsResult lesson) {
    final translations = LocalisationStrings.of(context);

    return IntrinsicHeight(
      child: Row(
        // Forces each Expanded child to match the full height of the tallest child
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildSmallCard(
              title: lesson.subject.name,
              subtitle: translations!.lessonSubject,
              imageData: lesson.subject.subjectPicture,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildSmallCard(
              title: lesson.lessonTutor.fullName,
              subtitle: translations.lessonTutor,
              rating: lesson.lessonTutor.averageRating,
              imageData: lesson.lessonTutor.profilePicture,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildSmallCard(
              title: lesson.lessonStudent.fullName,
              subtitle: translations.lessonStudent,
              rating: lesson.lessonStudent.averageRating,
              imageData: lesson.lessonStudent.profilePicture,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallCard({
    required String title,
    required String subtitle,
    Uint8List? imageData,
    double? rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
      ),
      child: Column(
        children: [
          // Image area
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.lightPrimaryColor,
              shape: BoxShape.circle,
              image: imageData != null
                  ? DecorationImage(
                image: MemoryImage(imageData),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: imageData == null
                ? const Icon(Icons.person, size: 30, color: Colors.grey)
                : null,
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          if (rating != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  rating.toStringAsFixed(1),
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildActionsCard(LessonDetailsResult lesson, LessonPrivileges privileges) {
    final canAcceptDecline = privileges.canAcceptDecline;
    final canCancel = privileges.canCancel;
    final canReview = privileges.canReview;
    final canAddTag = privileges.canAddTag;
    final translations = LocalisationStrings.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          // Accept
          ElevatedButton(
            style: _actionButtonStyle(),
            onPressed: canAcceptDecline ? () => _handleAccept(lesson.id) : null,
            child: Text(translations!.lessonAccept),
          ),
          // Decline
          ElevatedButton(
            style: _actionButtonStyle(backgroundColor: Colors.red),
            onPressed: canAcceptDecline ? () => _handleDecline(lesson.id) : null,
            child: Text(translations.lessonDecline),
          ),
          // Cancel
          ElevatedButton(
            style: _actionButtonStyle(backgroundColor: Colors.orange),
            onPressed: canCancel ? () => _handleCancel(lesson.id) : null,
            child: Text(translations.lessonCancel),
          ),
          // +Tag
          ElevatedButton(
            style: _actionButtonStyle(backgroundColor: AppColors.darkPrimaryColor),
            onPressed: canAddTag
                ? () async {
              final notifier = ref.read(lessonDetailsProvider.notifier);
              await showDialog<void>(
                context: context,
                builder: (_) => AddTagDialog(
                  lessonId: lesson.id,
                  onSubmitted: (tagName, tagDesc) async {
                    await notifier.addTagToLesson(
                      lessonId: lesson.id,
                      tagName: tagName,
                      tagDescription: tagDesc,
                    );
                  },
                ),
              );
            }
                : null,
            child: Text(translations.lessonAddTag),
          ),
          // Add Review
          ElevatedButton(
            style: _actionButtonStyle(backgroundColor: Colors.blueGrey),
            onPressed: canReview
                ? () async {
              final notifier = ref.read(lessonDetailsProvider.notifier);
              await showDialog<void>(
                context: context,
                builder: (_) => AddReviewDialog(
                  lesson: lesson,
                  onSubmitted: (rating, comment) async {
                    final isUserTutor = lesson.viewedByTutor;
                    final reviewType = isUserTutor
                        ? ReviewVariants.reviewOfStudent
                        : ReviewVariants.reviewOfTutor;
                    await notifier.leaveReview(
                      lessonId: lesson.id,
                      tutorId: lesson.lessonTutor.id,
                      studentId: lesson.lessonStudent.id,
                      reviewType: reviewType,
                      rating: rating,
                      comment: comment,
                    );
                  },
                ),
              );
            }
                : null,
            child: Text(translations.lessonReview),
          ),
        ],
      ),
    );
  }

  ButtonStyle _actionButtonStyle({Color backgroundColor = AppColors.darkPrimaryColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }

  Widget _buildTagSection(LessonDetailsResult lesson, LessonPrivileges? privileges) {
    final canAddTag = privileges?.canAddTag ?? false;
    final translations = LocalisationStrings.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          translations!.lessonTags,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        if (lesson.tags.isEmpty)
          Text(
            translations.lessonNoTags,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.secondaryTextColor,
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            verticalDirection: VerticalDirection.down,
            children: lesson.tags.map((tag) {
              return _buildTagBubble(tag, canAddTag, lesson.id);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildTagBubble(LessonTag tag, bool canAddTag, String lessonId) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFE1F5FE),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 3,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tag title
                Expanded(
                  child: Text(
                    tag.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Remove button
                if (canAddTag)
                  GestureDetector(
                    onTap: () => _handleRemoveTag(lessonId, tag.id),
                    child: const Icon(Icons.close, color: Colors.red, size: 18),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            // Tag description
            Text(
              tag.description,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _handleAccept(String lessonId) async {
    await ref.read(lessonDetailsProvider.notifier).acceptOrDeclineLesson(lessonId, true);
  }

  Future<void> _handleDecline(String lessonId) async {
    await ref.read(lessonDetailsProvider.notifier).acceptOrDeclineLesson(lessonId, false);
  }

  Future<void> _handleCancel(String lessonId) async {
    await ref.read(lessonDetailsProvider.notifier).cancelLesson(lessonId);
  }

  Future<void> _handleRemoveTag(String lessonId, String tagId) async {
    await ref
        .read(lessonDetailsProvider.notifier)
        .removeTagFromLesson(lessonId: lessonId, tagId: tagId);
  }

  String _formatDate(DateTime dt) {
    // e.g. "2025-01-19 15:35"
    final year = dt.year;
    final month = _twoDigits(dt.month);
    final day = _twoDigits(dt.day);
    final hour = _twoDigits(dt.hour);
    final minute = _twoDigits(dt.minute);
    return "$year-$month-$day  $hour:$minute";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
