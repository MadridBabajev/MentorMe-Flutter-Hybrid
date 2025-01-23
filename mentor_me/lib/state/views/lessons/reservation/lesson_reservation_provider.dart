import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/logger/logger.dart';
import 'package:mentor_me/common/service_providers/mentor_me_api_provider.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/request/reserve_lesson_request_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/availabilities/request/new_availability_payload.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/lesson_payment_method.dart';
import 'package:mentor_me/state/views/lessons/reservation/lesson_reservation_state.dart';

final lessonReservationProvider =
    StateNotifierProvider<LessonReservationNotifier, LessonReservationState>(
  (ref) {
    return LessonReservationNotifier(ref);
  },
);

class LessonReservationNotifier extends StateNotifier<LessonReservationState> {
  final Ref ref;
  final AppLogger _logger;

  LessonReservationNotifier(this.ref)
      : _logger = AppLogger(),
        super(LessonReservationState.initial());

  /// Fetch data needed to reserve a lesson (e.g. payment methods, availabilities, subjects).
  Future<void> fetchReservationData(String tutorId) async {
    state = state.copyWith(
      status: LessonReservationStatus.loading,
      errorMessage: null,
    );

    try {
      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      final reservationOptions =
          await lessonService.getReserveLessonData(tutorId);
      // Build timeslots from reservationOptions.availabilities
      final generatedSlots = _generateTimeSlotsForTwoWeeks(
        reservationOptions.availabilities ?? [],
      );

      state = state.copyWith(
        status: LessonReservationStatus.loaded,
        reservationOptions: reservationOptions,
        timeSlots: generatedSlots,
      );
    } catch (e, st) {
      _logger.logError("Error fetching reservation data: $e\n$st");
      state = state.copyWith(
        status: LessonReservationStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  List<DateTimeSlot> _generateTimeSlotsForTwoWeeks(
    List<NewAvailabilityPayload> availabilities,
  ) {
    final now = DateTime.now();
    final twoWeeksFromNow = now.add(const Duration(days: 14));

    final List<DateTimeSlot> slots = [];

    // Iterate day-by-day from 'now' to 14 days later.
    for (DateTime day = DateTime(now.year, now.month, now.day);
        !day.isAfter(twoWeeksFromNow);
        day = day.add(const Duration(days: 1))) {
      // Dart: Monday=1, Tuesday=2, ... Sunday=7
      final dartDay = day.weekday;

      for (final avail in availabilities) {
        final serverDay = avail.dayOfTheWeek.index + 1;

        if (serverDay == dartDay) {
          final fromParts = avail.fromHours.split(':');
          final toParts = avail.toHours.split(':');

          if (fromParts.length >= 2 && toParts.length >= 2) {
            final fromHour = int.tryParse(fromParts[0]) ?? 0;
            final fromMinute = int.tryParse(fromParts[1]) ?? 0;

            final toHour = int.tryParse(toParts[0]) ?? 0;
            final toMinute = int.tryParse(toParts[1]) ?? 0;

            final fromDateTime = DateTime(
              day.year,
              day.month,
              day.day,
              fromHour,
              fromMinute,
            );
            final toDateTime = DateTime(
              day.year,
              day.month,
              day.day,
              toHour,
              toMinute,
            );

            var currentStart = fromDateTime;
            while (currentStart.isBefore(toDateTime)) {
              final nextStart = currentStart.add(const Duration(hours: 1));

              if (!nextStart.isAfter(toDateTime)) {
                slots.add(DateTimeSlot(start: currentStart, end: nextStart));
              }
              currentStart = nextStart;
            }
          }
        }
      }
    }

    return slots;
  }

  void selectPaymentMethod(LessonPaymentMethod method) {
    state = state.copyWith(selectedPaymentMethod: method);
  }

  void selectSubject(SubjectNameEntry subject) {
    state = state.copyWith(selectedSubject: subject);
  }

  void selectTimeSlot(DateTimeSlot slot) {
    state = state.copyWith(selectedSlot: slot);
  }

  Future<String?> reserveLesson(String tutorId) async {
    try {
      if (state.selectedPaymentMethod == null ||
          state.selectedSubject == null ||
          state.selectedSlot == null) {
        throw Exception(
            "Missing selection: payment method, subject, or timeslot.");
      }

      final payload = ReserveLessonRequestPayload(
        tutorId: tutorId,
        paymentMethodId: state.selectedPaymentMethod!.id,
        subjectId: state.selectedSubject!.id,
        startTime: state.selectedSlot!.start,
        endTime: state.selectedSlot!.end,
      );

      final lessonService = ref.read(mentorMeApiProvider).lessonService;
      final lessonId = await lessonService.reserveLesson(payload);

      return lessonId.lessonId;
    } catch (e, st) {
      _logger.logError("Error reserving lesson: $e\n$st");
      state = state.copyWith(
        status: LessonReservationStatus.error,
        errorMessage: e.toString(),
      );
      return null;
    }
  }
}
