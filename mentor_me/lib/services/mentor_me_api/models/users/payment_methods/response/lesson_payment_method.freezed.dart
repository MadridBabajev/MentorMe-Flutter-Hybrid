// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonPaymentMethod _$LessonPaymentMethodFromJson(Map<String, dynamic> json) {
  return _LessonPaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$LessonPaymentMethod {
  String get id => throw _privateConstructorUsedError;
  PaymentMethodVariants get paymentMethodType =>
      throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  /// Serializes this LessonPaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonPaymentMethodCopyWith<LessonPaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonPaymentMethodCopyWith<$Res> {
  factory $LessonPaymentMethodCopyWith(
          LessonPaymentMethod value, $Res Function(LessonPaymentMethod) then) =
      _$LessonPaymentMethodCopyWithImpl<$Res, LessonPaymentMethod>;
  @useResult
  $Res call(
      {String id, PaymentMethodVariants paymentMethodType, String? details});
}

/// @nodoc
class _$LessonPaymentMethodCopyWithImpl<$Res, $Val extends LessonPaymentMethod>
    implements $LessonPaymentMethodCopyWith<$Res> {
  _$LessonPaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethodType = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodVariants,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonPaymentMethodImplCopyWith<$Res>
    implements $LessonPaymentMethodCopyWith<$Res> {
  factory _$$LessonPaymentMethodImplCopyWith(_$LessonPaymentMethodImpl value,
          $Res Function(_$LessonPaymentMethodImpl) then) =
      __$$LessonPaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, PaymentMethodVariants paymentMethodType, String? details});
}

/// @nodoc
class __$$LessonPaymentMethodImplCopyWithImpl<$Res>
    extends _$LessonPaymentMethodCopyWithImpl<$Res, _$LessonPaymentMethodImpl>
    implements _$$LessonPaymentMethodImplCopyWith<$Res> {
  __$$LessonPaymentMethodImplCopyWithImpl(_$LessonPaymentMethodImpl _value,
      $Res Function(_$LessonPaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethodType = null,
    Object? details = freezed,
  }) {
    return _then(_$LessonPaymentMethodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodVariants,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonPaymentMethodImpl implements _LessonPaymentMethod {
  const _$LessonPaymentMethodImpl(
      {required this.id,
      required this.paymentMethodType,
      required this.details});

  factory _$LessonPaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonPaymentMethodImplFromJson(json);

  @override
  final String id;
  @override
  final PaymentMethodVariants paymentMethodType;
  @override
  final String? details;

  @override
  String toString() {
    return 'LessonPaymentMethod(id: $id, paymentMethodType: $paymentMethodType, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonPaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethodType, paymentMethodType) ||
                other.paymentMethodType == paymentMethodType) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, paymentMethodType, details);

  /// Create a copy of LessonPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonPaymentMethodImplCopyWith<_$LessonPaymentMethodImpl> get copyWith =>
      __$$LessonPaymentMethodImplCopyWithImpl<_$LessonPaymentMethodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonPaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _LessonPaymentMethod implements LessonPaymentMethod {
  const factory _LessonPaymentMethod(
      {required final String id,
      required final PaymentMethodVariants paymentMethodType,
      required final String? details}) = _$LessonPaymentMethodImpl;

  factory _LessonPaymentMethod.fromJson(Map<String, dynamic> json) =
      _$LessonPaymentMethodImpl.fromJson;

  @override
  String get id;
  @override
  PaymentMethodVariants get paymentMethodType;
  @override
  String? get details;

  /// Create a copy of LessonPaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonPaymentMethodImplCopyWith<_$LessonPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
