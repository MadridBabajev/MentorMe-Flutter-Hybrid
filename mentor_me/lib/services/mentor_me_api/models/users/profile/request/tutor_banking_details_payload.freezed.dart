// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_banking_details_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TutorBankingDetailsPayload _$TutorBankingDetailsPayloadFromJson(
    Map<String, dynamic> json) {
  return _TutorBankingDetailsPayload.fromJson(json);
}

/// @nodoc
mixin _$TutorBankingDetailsPayload {
  String get bankAccountNumber => throw _privateConstructorUsedError;
  String get bankAccountName => throw _privateConstructorUsedError;
  int get bankAccountType => throw _privateConstructorUsedError;

  /// Serializes this TutorBankingDetailsPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TutorBankingDetailsPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TutorBankingDetailsPayloadCopyWith<TutorBankingDetailsPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorBankingDetailsPayloadCopyWith<$Res> {
  factory $TutorBankingDetailsPayloadCopyWith(TutorBankingDetailsPayload value,
          $Res Function(TutorBankingDetailsPayload) then) =
      _$TutorBankingDetailsPayloadCopyWithImpl<$Res,
          TutorBankingDetailsPayload>;
  @useResult
  $Res call(
      {String bankAccountNumber, String bankAccountName, int bankAccountType});
}

/// @nodoc
class _$TutorBankingDetailsPayloadCopyWithImpl<$Res,
        $Val extends TutorBankingDetailsPayload>
    implements $TutorBankingDetailsPayloadCopyWith<$Res> {
  _$TutorBankingDetailsPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TutorBankingDetailsPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountNumber = null,
    Object? bankAccountName = null,
    Object? bankAccountType = null,
  }) {
    return _then(_value.copyWith(
      bankAccountNumber: null == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountType: null == bankAccountType
          ? _value.bankAccountType
          : bankAccountType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorBankingDetailsPayloadImplCopyWith<$Res>
    implements $TutorBankingDetailsPayloadCopyWith<$Res> {
  factory _$$TutorBankingDetailsPayloadImplCopyWith(
          _$TutorBankingDetailsPayloadImpl value,
          $Res Function(_$TutorBankingDetailsPayloadImpl) then) =
      __$$TutorBankingDetailsPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bankAccountNumber, String bankAccountName, int bankAccountType});
}

/// @nodoc
class __$$TutorBankingDetailsPayloadImplCopyWithImpl<$Res>
    extends _$TutorBankingDetailsPayloadCopyWithImpl<$Res,
        _$TutorBankingDetailsPayloadImpl>
    implements _$$TutorBankingDetailsPayloadImplCopyWith<$Res> {
  __$$TutorBankingDetailsPayloadImplCopyWithImpl(
      _$TutorBankingDetailsPayloadImpl _value,
      $Res Function(_$TutorBankingDetailsPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of TutorBankingDetailsPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountNumber = null,
    Object? bankAccountName = null,
    Object? bankAccountType = null,
  }) {
    return _then(_$TutorBankingDetailsPayloadImpl(
      bankAccountNumber: null == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountType: null == bankAccountType
          ? _value.bankAccountType
          : bankAccountType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TutorBankingDetailsPayloadImpl implements _TutorBankingDetailsPayload {
  const _$TutorBankingDetailsPayloadImpl(
      {required this.bankAccountNumber,
      required this.bankAccountName,
      required this.bankAccountType});

  factory _$TutorBankingDetailsPayloadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TutorBankingDetailsPayloadImplFromJson(json);

  @override
  final String bankAccountNumber;
  @override
  final String bankAccountName;
  @override
  final int bankAccountType;

  @override
  String toString() {
    return 'TutorBankingDetailsPayload(bankAccountNumber: $bankAccountNumber, bankAccountName: $bankAccountName, bankAccountType: $bankAccountType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorBankingDetailsPayloadImpl &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountType, bankAccountType) ||
                other.bankAccountType == bankAccountType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, bankAccountNumber, bankAccountName, bankAccountType);

  /// Create a copy of TutorBankingDetailsPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorBankingDetailsPayloadImplCopyWith<_$TutorBankingDetailsPayloadImpl>
      get copyWith => __$$TutorBankingDetailsPayloadImplCopyWithImpl<
          _$TutorBankingDetailsPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorBankingDetailsPayloadImplToJson(
      this,
    );
  }
}

abstract class _TutorBankingDetailsPayload
    implements TutorBankingDetailsPayload {
  const factory _TutorBankingDetailsPayload(
      {required final String bankAccountNumber,
      required final String bankAccountName,
      required final int bankAccountType}) = _$TutorBankingDetailsPayloadImpl;

  factory _TutorBankingDetailsPayload.fromJson(Map<String, dynamic> json) =
      _$TutorBankingDetailsPayloadImpl.fromJson;

  @override
  String get bankAccountNumber;
  @override
  String get bankAccountName;
  @override
  int get bankAccountType;

  /// Create a copy of TutorBankingDetailsPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TutorBankingDetailsPayloadImplCopyWith<_$TutorBankingDetailsPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
