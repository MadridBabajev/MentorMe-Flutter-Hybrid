import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/payment_method_variants.dart';

part 'lesson_payment_method.freezed.dart';
part 'lesson_payment_method.g.dart';

@freezed
class LessonPaymentMethod with _$LessonPaymentMethod {
  const factory LessonPaymentMethod({
    required String id,
    required PaymentMethodVariants paymentMethodType,
    required String? details,
  }) = _LessonPaymentMethod;

  factory LessonPaymentMethod.fromJson(Map<String, dynamic> json)
    => _$LessonPaymentMethodFromJson(json);
}
