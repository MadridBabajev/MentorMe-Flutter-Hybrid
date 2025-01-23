// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_banking_details_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TutorBankingDetailsResult _$TutorBankingDetailsResultFromJson(
    Map<String, dynamic> json) {
  return _TutorBankingDetailsResult.fromJson(json);
}

/// @nodoc
mixin _$TutorBankingDetailsResult {
  String get bankAccountNumber => throw _privateConstructorUsedError;
  String get bankAccountName => throw _privateConstructorUsedError;
  BankAccountVariants get bankAccountType => throw _privateConstructorUsedError;

  /// Serializes this TutorBankingDetailsResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TutorBankingDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TutorBankingDetailsResultCopyWith<TutorBankingDetailsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorBankingDetailsResultCopyWith<$Res> {
  factory $TutorBankingDetailsResultCopyWith(TutorBankingDetailsResult value,
          $Res Function(TutorBankingDetailsResult) then) =
      _$TutorBankingDetailsResultCopyWithImpl<$Res, TutorBankingDetailsResult>;
  @useResult
  $Res call(
      {String bankAccountNumber,
      String bankAccountName,
      BankAccountVariants bankAccountType});
}

/// @nodoc
class _$TutorBankingDetailsResultCopyWithImpl<$Res,
        $Val extends TutorBankingDetailsResult>
    implements $TutorBankingDetailsResultCopyWith<$Res> {
  _$TutorBankingDetailsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TutorBankingDetailsResult
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
              as BankAccountVariants,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorBankingDetailsResultImplCopyWith<$Res>
    implements $TutorBankingDetailsResultCopyWith<$Res> {
  factory _$$TutorBankingDetailsResultImplCopyWith(
          _$TutorBankingDetailsResultImpl value,
          $Res Function(_$TutorBankingDetailsResultImpl) then) =
      __$$TutorBankingDetailsResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bankAccountNumber,
      String bankAccountName,
      BankAccountVariants bankAccountType});
}

/// @nodoc
class __$$TutorBankingDetailsResultImplCopyWithImpl<$Res>
    extends _$TutorBankingDetailsResultCopyWithImpl<$Res,
        _$TutorBankingDetailsResultImpl>
    implements _$$TutorBankingDetailsResultImplCopyWith<$Res> {
  __$$TutorBankingDetailsResultImplCopyWithImpl(
      _$TutorBankingDetailsResultImpl _value,
      $Res Function(_$TutorBankingDetailsResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TutorBankingDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountNumber = null,
    Object? bankAccountName = null,
    Object? bankAccountType = null,
  }) {
    return _then(_$TutorBankingDetailsResultImpl(
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
              as BankAccountVariants,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TutorBankingDetailsResultImpl implements _TutorBankingDetailsResult {
  const _$TutorBankingDetailsResultImpl(
      {required this.bankAccountNumber,
      required this.bankAccountName,
      required this.bankAccountType});

  factory _$TutorBankingDetailsResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorBankingDetailsResultImplFromJson(json);

  @override
  final String bankAccountNumber;
  @override
  final String bankAccountName;
  @override
  final BankAccountVariants bankAccountType;

  @override
  String toString() {
    return 'TutorBankingDetailsResult(bankAccountNumber: $bankAccountNumber, bankAccountName: $bankAccountName, bankAccountType: $bankAccountType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorBankingDetailsResultImpl &&
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

  /// Create a copy of TutorBankingDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorBankingDetailsResultImplCopyWith<_$TutorBankingDetailsResultImpl>
      get copyWith => __$$TutorBankingDetailsResultImplCopyWithImpl<
          _$TutorBankingDetailsResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorBankingDetailsResultImplToJson(
      this,
    );
  }
}

abstract class _TutorBankingDetailsResult implements TutorBankingDetailsResult {
  const factory _TutorBankingDetailsResult(
          {required final String bankAccountNumber,
          required final String bankAccountName,
          required final BankAccountVariants bankAccountType}) =
      _$TutorBankingDetailsResultImpl;

  factory _TutorBankingDetailsResult.fromJson(Map<String, dynamic> json) =
      _$TutorBankingDetailsResultImpl.fromJson;

  @override
  String get bankAccountNumber;
  @override
  String get bankAccountName;
  @override
  BankAccountVariants get bankAccountType;

  /// Create a copy of TutorBankingDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TutorBankingDetailsResultImplCopyWith<_$TutorBankingDetailsResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
