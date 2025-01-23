// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodEntry _$PaymentMethodEntryFromJson(Map<String, dynamic> json) {
  return _PaymentMethodEntry.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodEntry {
  String get id => throw _privateConstructorUsedError;
  PaymentMethodVariants get paymentMethodType =>
      throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: "CardCvv")
  String get cardCVC => throw _privateConstructorUsedError;
  String get cardExpirationDate => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get ownerFullName => throw _privateConstructorUsedError;
  Countries get ownerCountry => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodEntryCopyWith<PaymentMethodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodEntryCopyWith<$Res> {
  factory $PaymentMethodEntryCopyWith(
          PaymentMethodEntry value, $Res Function(PaymentMethodEntry) then) =
      _$PaymentMethodEntryCopyWithImpl<$Res, PaymentMethodEntry>;
  @useResult
  $Res call(
      {String id,
      PaymentMethodVariants paymentMethodType,
      String details,
      @JsonKey(name: "CardCvv") String cardCVC,
      String cardExpirationDate,
      String cardNumber,
      String ownerFullName,
      Countries ownerCountry});
}

/// @nodoc
class _$PaymentMethodEntryCopyWithImpl<$Res, $Val extends PaymentMethodEntry>
    implements $PaymentMethodEntryCopyWith<$Res> {
  _$PaymentMethodEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethodType = null,
    Object? details = null,
    Object? cardCVC = null,
    Object? cardExpirationDate = null,
    Object? cardNumber = null,
    Object? ownerFullName = null,
    Object? ownerCountry = null,
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
      ownerFullName: null == ownerFullName
          ? _value.ownerFullName
          : ownerFullName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerCountry: null == ownerCountry
          ? _value.ownerCountry
          : ownerCountry // ignore: cast_nullable_to_non_nullable
              as Countries,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodEntryImplCopyWith<$Res>
    implements $PaymentMethodEntryCopyWith<$Res> {
  factory _$$PaymentMethodEntryImplCopyWith(_$PaymentMethodEntryImpl value,
          $Res Function(_$PaymentMethodEntryImpl) then) =
      __$$PaymentMethodEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PaymentMethodVariants paymentMethodType,
      String details,
      @JsonKey(name: "CardCvv") String cardCVC,
      String cardExpirationDate,
      String cardNumber,
      String ownerFullName,
      Countries ownerCountry});
}

/// @nodoc
class __$$PaymentMethodEntryImplCopyWithImpl<$Res>
    extends _$PaymentMethodEntryCopyWithImpl<$Res, _$PaymentMethodEntryImpl>
    implements _$$PaymentMethodEntryImplCopyWith<$Res> {
  __$$PaymentMethodEntryImplCopyWithImpl(_$PaymentMethodEntryImpl _value,
      $Res Function(_$PaymentMethodEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethodType = null,
    Object? details = null,
    Object? cardCVC = null,
    Object? cardExpirationDate = null,
    Object? cardNumber = null,
    Object? ownerFullName = null,
    Object? ownerCountry = null,
  }) {
    return _then(_$PaymentMethodEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodVariants,
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
      ownerFullName: null == ownerFullName
          ? _value.ownerFullName
          : ownerFullName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerCountry: null == ownerCountry
          ? _value.ownerCountry
          : ownerCountry // ignore: cast_nullable_to_non_nullable
              as Countries,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodEntryImpl implements _PaymentMethodEntry {
  const _$PaymentMethodEntryImpl(
      {required this.id,
      required this.paymentMethodType,
      required this.details,
      @JsonKey(name: "CardCvv") required this.cardCVC,
      required this.cardExpirationDate,
      required this.cardNumber,
      required this.ownerFullName,
      required this.ownerCountry});

  factory _$PaymentMethodEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodEntryImplFromJson(json);

  @override
  final String id;
  @override
  final PaymentMethodVariants paymentMethodType;
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
  final String ownerFullName;
  @override
  final Countries ownerCountry;

  @override
  String toString() {
    return 'PaymentMethodEntry(id: $id, paymentMethodType: $paymentMethodType, details: $details, cardCVC: $cardCVC, cardExpirationDate: $cardExpirationDate, cardNumber: $cardNumber, ownerFullName: $ownerFullName, ownerCountry: $ownerCountry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethodType, paymentMethodType) ||
                other.paymentMethodType == paymentMethodType) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.cardCVC, cardCVC) || other.cardCVC == cardCVC) &&
            (identical(other.cardExpirationDate, cardExpirationDate) ||
                other.cardExpirationDate == cardExpirationDate) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.ownerFullName, ownerFullName) ||
                other.ownerFullName == ownerFullName) &&
            (identical(other.ownerCountry, ownerCountry) ||
                other.ownerCountry == ownerCountry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, paymentMethodType, details,
      cardCVC, cardExpirationDate, cardNumber, ownerFullName, ownerCountry);

  /// Create a copy of PaymentMethodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodEntryImplCopyWith<_$PaymentMethodEntryImpl> get copyWith =>
      __$$PaymentMethodEntryImplCopyWithImpl<_$PaymentMethodEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodEntryImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodEntry implements PaymentMethodEntry {
  const factory _PaymentMethodEntry(
      {required final String id,
      required final PaymentMethodVariants paymentMethodType,
      required final String details,
      @JsonKey(name: "CardCvv") required final String cardCVC,
      required final String cardExpirationDate,
      required final String cardNumber,
      required final String ownerFullName,
      required final Countries ownerCountry}) = _$PaymentMethodEntryImpl;

  factory _PaymentMethodEntry.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodEntryImpl.fromJson;

  @override
  String get id;
  @override
  PaymentMethodVariants get paymentMethodType;
  @override
  String get details;
  @override
  @JsonKey(name: "CardCvv")
  String get cardCVC;
  @override
  String get cardExpirationDate;
  @override
  String get cardNumber;
  @override
  String get ownerFullName;
  @override
  Countries get ownerCountry;

  /// Create a copy of PaymentMethodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodEntryImplCopyWith<_$PaymentMethodEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
