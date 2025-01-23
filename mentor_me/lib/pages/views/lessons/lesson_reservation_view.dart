import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_me/common/constants/app_navigation_routes.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/common/extentions/extentions.dart';
import 'package:mentor_me/l10n/app_localizations.dart';
import 'package:mentor_me/pages/components/animations/error_animation_view.dart';
import 'package:mentor_me/pages/components/animations/loading_animation_view.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/lesson_payment_method.dart';
import 'package:mentor_me/state/views/lessons/reservation/lesson_reservation_provider.dart';
import 'package:mentor_me/state/views/lessons/reservation/lesson_reservation_state.dart';

class LessonReservationView extends ConsumerStatefulWidget {
  const LessonReservationView({super.key});

  @override
  ConsumerState createState() => _LessonReservationViewState();
}

class _LessonReservationViewState extends ConsumerState<LessonReservationView> {
  String? _tutorId;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      final argMap = ModalRoute.of(context)?.settings.arguments;
      if (argMap is Map && argMap[NavigationArgs.tutorId] is String) {
        _tutorId = argMap[NavigationArgs.tutorId] as String;
        // fetch reservation data
        Future.microtask(() {
          ref
              .read(lessonReservationProvider.notifier)
              .fetchReservationData(_tutorId!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final reservationState = ref.watch(lessonReservationProvider);
    final translations = LocalisationStrings.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          translations!.reservationTitle,
          style: GoogleFonts.poppins(color: AppColors.textIconsColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Builder(
        builder: (context) {
          switch (reservationState.status) {
            case LessonReservationStatus.initial:
              return const SizedBox.shrink();

            case LessonReservationStatus.loading:
              return const Center(child: LoadingAnimationView());

            case LessonReservationStatus.loaded:
              return _buildReservationForm(reservationState);

            case LessonReservationStatus.error:
              return _buildErrorState(reservationState);
          }
        },
      ),
    );
  }

  Widget _buildErrorState(LessonReservationState state) {
    final translations = LocalisationStrings.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${translations!.reservationError} ${state.errorMessage ?? translations.reservationErrorUnknown}",
          style: GoogleFonts.poppins(color: AppColors.errorColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        const ErrorAnimationView(),
      ],
    );
  }

  Widget _buildReservationForm(LessonReservationState state) {
    final reservationOptions = state.reservationOptions;
    final translations = LocalisationStrings.of(context);

    if (reservationOptions == null) {
      return Center(child: Text(translations!.reservationNoOptions));
    }
    final paymentMethods = reservationOptions.paymentMethods ?? [];
    final subjects = reservationOptions.subjects ?? [];
    final timeSlots = state.timeSlots;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Methods
          Text(
            translations!.reservationSelectPaymentMethod,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          _buildPaymentMethodDropdown(
              paymentMethods, state.selectedPaymentMethod),
          const SizedBox(height: 16),

          // Subjects
          Text(
            translations.reservationSelectSubject,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          _buildSubjectDropdown(subjects, state.selectedSubject),
          const SizedBox(height: 16),

          // Timeslots
          Text(
            translations.reservationSelectTimeslot,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          _buildTimeSlotsList(timeSlots, state.selectedSlot),
          const SizedBox(height: 16),

          // Reserve button
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (_tutorId == null) return;
                final lessonId = await ref
                    .read(lessonReservationProvider.notifier)
                    .reserveLesson(_tutorId!);
                if (lessonId != null) {
                  // Navigate to lesson details
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.lessonDetails,
                    (route) => route.isFirst,
                    arguments: {NavigationArgs.lessonId: lessonId},
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: Text(
                translations.reservationReserveLesson,
                style: GoogleFonts.poppins(color: AppColors.textIconsColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodDropdown(
    List<LessonPaymentMethod> paymentMethods,
    LessonPaymentMethod? selected,
  ) {
    final notifier = ref.read(lessonReservationProvider.notifier);
    final translations = LocalisationStrings.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<LessonPaymentMethod>(
        value: selected,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        hint: Text(
          translations!.reservationChoosePaymentMethod,
          style: GoogleFonts.poppins(
              fontSize: 14, color: AppColors.secondaryTextColor),
        ),
        items: paymentMethods.map((method) {
          return DropdownMenuItem<LessonPaymentMethod>(
            value: method,
            child: Text(
              "${method.paymentMethodType.name.capitalize()} ${method.details ?? ''}",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            notifier.selectPaymentMethod(value);
          }
        },
      ),
    );
  }

  Widget _buildSubjectDropdown(
    List<SubjectNameEntry> subjects,
    SubjectNameEntry? selected,
  ) {
    final notifier = ref.read(lessonReservationProvider.notifier);
    final translations = LocalisationStrings.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<SubjectNameEntry>(
        value: selected,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        hint: Text(
          translations!.reservationChooseSubject,
          style: GoogleFonts.poppins(
              fontSize: 14, color: AppColors.secondaryTextColor),
        ),
        items: subjects.map((subject) {
          return DropdownMenuItem<SubjectNameEntry>(
            value: subject,
            child: Text(
              subject.name,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            notifier.selectSubject(value);
          }
        },
      ),
    );
  }

  Widget _buildTimeSlotsList(List<DateTimeSlot> slots, DateTimeSlot? selected) {
    final notifier = ref.read(lessonReservationProvider.notifier);
    final translations = LocalisationStrings.of(context);

    if (slots.isEmpty) {
      return Text(
        translations!.reservationNoTimeslotsAvailable,
        style: GoogleFonts.poppins(color: AppColors.secondaryTextColor),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: slots.map((slot) {
          final isSelected =
              selected?.start == slot.start && selected?.end == slot.end;
          return RadioListTile<bool>(
            title: Text(
              _formatSlot(slot),
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            value: true,
            groupValue: isSelected,
            onChanged: (_) {
              // user selected the time slot
              notifier.selectTimeSlot(slot);
            },
            selected: isSelected,
            activeColor: AppColors.darkPrimaryColor,
          );
        }).toList(),
      ),
    );
  }

  /// Format the timeslot, e.g. "Mon, Jan 16 - 15:00 to 16:00"
  String _formatSlot(DateTimeSlot slot) {
    final start = slot.start;
    final end = slot.end;
    final dayStr =
        "${start.weekdayNameShort()}, ${start.monthNameShort()} ${start.day}";
    final startTime = "${_twoDigits(start.hour)}:${_twoDigits(start.minute)}";
    final endTime = "${_twoDigits(end.hour)}:${_twoDigits(end.minute)}";
    return "$dayStr - $startTime to $endTime";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
