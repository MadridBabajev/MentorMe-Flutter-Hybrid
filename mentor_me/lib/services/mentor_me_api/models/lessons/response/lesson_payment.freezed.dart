// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonPayment _$LessonPaymentFromJson(Map<String, dynamic> json) {
  return _LessonPayment.fromJson(json);
}

/// @nodoc
mixin _$LessonPayment {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double? get additionalFees => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get senderStudentFullName => throw _privateConstructorUsedError;
  String get recipientTutorFullName => throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  PaymentMethodVariants get paymentMethodType =>
      throw _privateConstructorUsedError;

  /// Serializes this LessonPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonPaymentCopyWith<LessonPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonPaymentCopyWith<$Res> {
  factory $LessonPaymentCopyWith(
          LessonPayment value, $Res Function(LessonPayment) then) =
      _$LessonPaymentCopyWithImpl<$Res, LessonPayment>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      double amount,
      double? additionalFees,
      String description,
      String senderStudentFullName,
      String recipientTutorFullName,
      PaymentStatus paymentStatus,
      PaymentMethodVariants paymentMethodType});
}

/// @nodoc
class _$LessonPaymentCopyWithImpl<$Res, $Val extends LessonPayment>
    implements $LessonPaymentCopyWith<$Res> {
  _$LessonPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? amount = null,
    Object? additionalFees = freezed,
    Object? description = null,
    Object? senderStudentFullName = null,
    Object? recipientTutorFullName = null,
    Object? paymentStatus = null,
    Object? paymentMethodType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      additionalFees: freezed == additionalFees
          ? _value.additionalFees
          : additionalFees // ignore: cast_nullable_to_non_nullable
              as double?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      senderStudentFullName: null == senderStudentFullName
          ? _value.senderStudentFullName
          : senderStudentFullName // ignore: cast_nullable_to_non_nullable
              as String,
      recipientTutorFullName: null == recipientTutorFullName
          ? _value.recipientTutorFullName
          : recipientTutorFullName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodVariants,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonPaymentImplCopyWith<$Res>
    implements $LessonPaymentCopyWith<$Res> {
  factory _$$LessonPaymentImplCopyWith(
          _$LessonPaymentImpl value, $Res Function(_$LessonPaymentImpl) then) =
      __$$LessonPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      double amount,
      double? additionalFees,
      String description,
      String senderStudentFullName,
      String recipientTutorFullName,
      PaymentStatus paymentStatus,
      PaymentMethodVariants paymentMethodType});
}

/// @nodoc
class __$$LessonPaymentImplCopyWithImpl<$Res>
    extends _$LessonPaymentCopyWithImpl<$Res, _$LessonPaymentImpl>
    implements _$$LessonPaymentImplCopyWith<$Res> {
  __$$LessonPaymentImplCopyWithImpl(
      _$LessonPaymentImpl _value, $Res Function(_$LessonPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? amount = null,
    Object? additionalFees = freezed,
    Object? description = null,
    Object? senderStudentFullName = null,
    Object? recipientTutorFullName = null,
    Object? paymentStatus = null,
    Object? paymentMethodType = null,
  }) {
    return _then(_$LessonPaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      additionalFees: freezed == additionalFees
          ? _value.additionalFees
          : additionalFees // ignore: cast_nullable_to_non_nullable
              as double?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      senderStudentFullName: null == senderStudentFullName
          ? _value.senderStudentFullName
          : senderStudentFullName // ignore: cast_nullable_to_non_nullable
              as String,
      recipientTutorFullName: null == recipientTutorFullName
          ? _value.recipientTutorFullName
          : recipientTutorFullName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodVariants,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonPaymentImpl implements _LessonPayment {
  const _$LessonPaymentImpl(
      {required this.id,
      required this.date,
      required this.amount,
      this.additionalFees,
      required this.description,
      required this.senderStudentFullName,
      required this.recipientTutorFullName,
      required this.paymentStatus,
      required this.paymentMethodType});

  factory _$LessonPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonPaymentImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final double amount;
  @override
  final double? additionalFees;
  @override
  final String description;
  @override
  final String senderStudentFullName;
  @override
  final String recipientTutorFullName;
  @override
  final PaymentStatus paymentStatus;
  @override
  final PaymentMethodVariants paymentMethodType;

  @override
  String toString() {
    return 'LessonPayment(id: $id, date: $date, amount: $amount, additionalFees: $additionalFees, description: $description, senderStudentFullName: $senderStudentFullName, recipientTutorFullName: $recipientTutorFullName, paymentStatus: $paymentStatus, paymentMethodType: $paymentMethodType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonPaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.additionalFees, additionalFees) ||
                other.additionalFees == additionalFees) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.senderStudentFullName, senderStudentFullName) ||
                other.senderStudentFullName == senderStudentFullName) &&
            (identical(other.recipientTutorFullName, recipientTutorFullName) ||
                other.recipientTutorFullName == recipientTutorFullName) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethodType, paymentMethodType) ||
                other.paymentMethodType == paymentMethodType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      amount,
      additionalFees,
      description,
      senderStudentFullName,
      recipientTutorFullName,
      paymentStatus,
      paymentMethodType);

  /// Create a copy of LessonPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonPaymentImplCopyWith<_$LessonPaymentImpl> get copyWith =>
      __$$LessonPaymentImplCopyWithImpl<_$LessonPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonPaymentImplToJson(
      this,
    );
  }
}

abstract class _LessonPayment implements LessonPayment {
  const factory _LessonPayment(
          {required final String id,
          required final DateTime date,
          required final double amount,
          final double? additionalFees,
          required final String description,
          required final String senderStudentFullName,
          required final String recipientTutorFullName,
          required final PaymentStatus paymentStatus,
          required final PaymentMethodVariants paymentMethodType}) =
      _$LessonPaymentImpl;

  factory _LessonPayment.fromJson(Map<String, dynamic> json) =
      _$LessonPaymentImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  double get amount;
  @override
  double? get additionalFees;
  @override
  String get description;
  @override
  String get senderStudentFullName;
  @override
  String get recipientTutorFullName;
  @override
  PaymentStatus get paymentStatus;
  @override
  PaymentMethodVariants get paymentMethodType;

  /// Create a copy of LessonPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonPaymentImplCopyWith<_$LessonPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
