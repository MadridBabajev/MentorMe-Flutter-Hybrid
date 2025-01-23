import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_reservation_options.dart';
import 'package:mentor_me/services/mentor_me_api/models/subjects/subject_name_entry.dart';
import 'package:mentor_me/services/mentor_me_api/models/users/payment_methods/response/lesson_payment_method.dart';

enum LessonReservationStatus { initial, loading, loaded, error }

/// Holds a start and end DateTime of a single hour slot
class DateTimeSlot {
  final DateTime start;
  final DateTime end;

  DateTimeSlot({required this.start, required this.end});

  @override
  String toString() => "$start - $end";
}

class LessonReservationState {
  final LessonReservationStatus status;
  final LessonReservationOptions? reservationOptions;
  final List<DateTimeSlot> timeSlots;
  final LessonPaymentMethod? selectedPaymentMethod;
  final SubjectNameEntry? selectedSubject;
  final DateTimeSlot? selectedSlot;
  final String? errorMessage;

  LessonReservationState({
    required this.status,
    this.reservationOptions,
    this.timeSlots = const [],
    this.selectedPaymentMethod,
    this.selectedSubject,
    this.selectedSlot,
    this.errorMessage,
  });

  factory LessonReservationState.initial() => LessonReservationState(
        status: LessonReservationStatus.initial,
        reservationOptions: null,
        timeSlots: const [],
      );

  LessonReservationState copyWith({
    LessonReservationStatus? status,
    LessonReservationOptions? reservationOptions,
    List<DateTimeSlot>? timeSlots,
    LessonPaymentMethod? selectedPaymentMethod,
    SubjectNameEntry? selectedSubject,
    DateTimeSlot? selectedSlot,
    String? errorMessage,
  }) {
    return LessonReservationState(
      status: status ?? this.status,
      reservationOptions: reservationOptions ?? this.reservationOptions,
      timeSlots: timeSlots ?? this.timeSlots,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectedSubject: selectedSubject ?? this.selectedSubject,
      selectedSlot: selectedSlot ?? this.selectedSlot,
      errorMessage: errorMessage,
    );
  }
}
