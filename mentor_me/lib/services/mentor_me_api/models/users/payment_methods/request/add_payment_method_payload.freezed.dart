// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_payment_method_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddPaymentMethodPayload _$AddPaymentMethodPayloadFromJson(
    Map<String, dynamic> json) {
  return _AddPaymentMethodPayload.fromJson(json);
}

/// @nodoc
mixin _$AddPaymentMethodPayload {
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: "CardCvv")
  String get cardCVC => throw _privateConstructorUsedError;
  String get cardExpirationDate => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;

  /// Serializes this AddPaymentMethodPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddPaymentMethodPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPaymentMethodPayloadCopyWith<AddPaymentMethodPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentMethodPayloadCopyWith<$Res> {
  factory $AddPaymentMethodPayloadCopyWith(AddPaymentMethodPayload value,
          $Res Function(AddPaymentMethodPayload) then) =
      _$AddPaymentMethodPayloadCopyWithImpl<$Res, AddPaymentMethodPayload>;
  @useResult
  $Res call(
      {String details,
      @JsonKey(name: "CardCvv") String cardCVC,
      String cardExpirationDate,
      String cardNumber});
}

/// @nodoc
class _$AddPaymentMethodPayloadCopyWithImpl<$Res,
        $Val extends AddPaymentMethodPayload>
    implements $AddPaymentMethodPayloadCopyWith<$Res> {
  _$AddPaymentMethodPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPaymentMethodPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? cardCVC = null,
    Object? cardExpirationDate = null,
    Object? cardNumber = null,
  }) {
    return _then(_value.copyWith(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      cardCVC: null == cardCVC
          ? _value.cardCVC
          : cardCVC // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpirationDate: null == cardExpirationDate
          ? _value.cardExpirationDate
          : cardExpirationDate // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPaymentMethodPayloadImplCopyWith<$Res>
    implements $AddPaymentMethodPayloadCopyWith<$Res> {
  factory _$$AddPaymentMethodPayloadImplCopyWith(
          _$AddPaymentMethodPayloadImpl value,
          $Res Function(_$AddPaymentMethodPayloadImpl) then) =
      __$$AddPaymentMethodPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String details,
      @JsonKey(name: "CardCvv") String cardCVC,
      String cardExpirationDate,
      String cardNumber});
}

/// @nodoc
class __$$AddPaymentMethodPayloadImplCopyWithImpl<$Res>
    extends _$AddPaymentMethodPayloadCopyWithImpl<$Res,
        _$AddPaymentMethodPayloadImpl>
    implements _$$AddPaymentMethodPayloadImplCopyWith<$Res> {
  __$$AddPaymentMethodPayloadImplCopyWithImpl(
      _$AddPaymentMethodPayloadImpl _value,
      $Res Function(_$AddPaymentMethodPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPaymentMethodPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? cardCVC = null,
    Object? cardExpirationDate = null,
    Object? cardNumber = null,
  }) {
    return _then(_$AddPaymentMethodPayloadImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      cardCVC: null == cardCVC
          ? _value.cardCVC
          : cardCVC // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpirationDate: null == cardExpirationDate
          ? _value.cardExpirationDate
          : cardExpirationDate // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddPaymentMethodPayloadImpl implements _AddPaymentMethodPayload {
  const _$AddPaymentMethodPayloadImpl(
      {required this.details,
      @JsonKey(name: "CardCvv") required this.cardCVC,
      required this.cardExpirationDate,
      required this.cardNumber});

  factory _$AddPaymentMethodPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddPaymentMethodPayloadImplFromJson(json);

  @override
  final String details;
  @override
  @JsonKey(name: "CardCvv")
  final String cardCVC;
  @override
  final String cardExpirationDate;
  @override
  final String cardNumber;

  @override
  String toString() {
    return 'AddPaymentMethodPayload(details: $details, cardCVC: $cardCVC, cardExpirationDate: $cardExpirationDate, cardNumber: $cardNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentMethodPayloadImpl &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.cardCVC, cardCVC) || other.cardCVC == cardCVC) &&
            (identical(other.cardExpirationDate, cardExpirationDate) ||
                other.cardExpirationDate == cardExpirationDate) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, details, cardCVC, cardExpirationDate, cardNumber);

  /// Create a copy of AddPaymentMethodPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentMethodPayloadImplCopyWith<_$AddPaymentMethodPayloadImpl>
      get copyWith => __$$AddPaymentMethodPayloadImplCopyWithImpl<
          _$AddPaymentMethodPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddPaymentMethodPayloadImplToJson(
      this,
    );
  }
}

abstract class _AddPaymentMethodPayload implements AddPaymentMethodPayload {
  const factory _AddPaymentMethodPayload(
      {required final String details,
      @JsonKey(name: "CardCvv") required final String cardCVC,
      required final String cardExpirationDate,
      required final String cardNumber}) = _$AddPaymentMethodPayloadImpl;

  factory _AddPaymentMethodPayload.fromJson(Map<String, dynamic> json) =
      _$AddPaymentMethodPayloadImpl.fromJson;

  @override
  String get details;
  @override
  @JsonKey(name: "CardCvv")
  String get cardCVC;
  @override
  String get cardExpirationDate;
  @override
  String get cardNumber;

  /// Create a copy of AddPaymentMethodPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPaymentMethodPayloadImplCopyWith<_$AddPaymentMethodPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
