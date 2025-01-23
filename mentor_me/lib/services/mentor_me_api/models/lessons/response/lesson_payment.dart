import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/payment_method_variants.dart';
import 'package:mentor_me/common/enums/payment_status.dart';

part 'lesson_payment.freezed.dart';
part 'lesson_payment.g.dart';

@freezed
class LessonPayment with _$LessonPayment {
  const factory LessonPayment({
    required String id,
    required DateTime date,
    required double amount,
    double? additionalFees,
    required String description,
    required String senderStudentFullName,
    required String recipientTutorFullName,
    required PaymentStatus paymentStatus,
    required PaymentMethodVariants paymentMethodType,
  }) = _LessonPayment;

  factory LessonPayment.fromJson(Map<String, dynamic> json) =>
      _$LessonPaymentFromJson(json);
}
