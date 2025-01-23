// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodListResult _$PaymentMethodListResultFromJson(
    Map<String, dynamic> json) {
  return _PaymentMethodListResult.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodListResult {
  List<PaymentMethodEntry>? get paymentMethodList =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodListResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodListResultCopyWith<PaymentMethodListResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodListResultCopyWith<$Res> {
  factory $PaymentMethodListResultCopyWith(PaymentMethodListResult value,
          $Res Function(PaymentMethodListResult) then) =
      _$PaymentMethodListResultCopyWithImpl<$Res, PaymentMethodListResult>;
  @useResult
  $Res call({List<PaymentMethodEntry>? paymentMethodList});
}

/// @nodoc
class _$PaymentMethodListResultCopyWithImpl<$Res,
        $Val extends PaymentMethodListResult>
    implements $PaymentMethodListResultCopyWith<$Res> {
  _$PaymentMethodListResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodList = freezed,
  }) {
    return _then(_value.copyWith(
      paymentMethodList: freezed == paymentMethodList
          ? _value.paymentMethodList
          : paymentMethodList // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodListResultImplCopyWith<$Res>
    implements $PaymentMethodListResultCopyWith<$Res> {
  factory _$$PaymentMethodListResultImplCopyWith(
          _$PaymentMethodListResultImpl value,
          $Res Function(_$PaymentMethodListResultImpl) then) =
      __$$PaymentMethodListResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PaymentMethodEntry>? paymentMethodList});
}

/// @nodoc
class __$$PaymentMethodListResultImplCopyWithImpl<$Res>
    extends _$PaymentMethodListResultCopyWithImpl<$Res,
        _$PaymentMethodListResultImpl>
    implements _$$PaymentMethodListResultImplCopyWith<$Res> {
  __$$PaymentMethodListResultImplCopyWithImpl(
      _$PaymentMethodListResultImpl _value,
      $Res Function(_$PaymentMethodListResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodList = freezed,
  }) {
    return _then(_$PaymentMethodListResultImpl(
      paymentMethodList: freezed == paymentMethodList
          ? _value._paymentMethodList
          : paymentMethodList // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodListResultImpl implements _PaymentMethodListResult {
  const _$PaymentMethodListResultImpl(
      {required final List<PaymentMethodEntry>? paymentMethodList})
      : _paymentMethodList = paymentMethodList;

  factory _$PaymentMethodListResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodListResultImplFromJson(json);

  final List<PaymentMethodEntry>? _paymentMethodList;
  @override
  List<PaymentMethodEntry>? get paymentMethodList {
    final value = _paymentMethodList;
    if (value == null) return null;
    if (_paymentMethodList is EqualUnmodifiableListView)
      return _paymentMethodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentMethodListResult(paymentMethodList: $paymentMethodList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodListResultImpl &&
            const DeepCollectionEquality()
                .equals(other._paymentMethodList, _paymentMethodList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_paymentMethodList));

  /// Create a copy of PaymentMethodListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodListResultImplCopyWith<_$PaymentMethodListResultImpl>
      get copyWith => __$$PaymentMethodListResultImplCopyWithImpl<
          _$PaymentMethodListResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodListResultImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodListResult implements PaymentMethodListResult {
  const factory _PaymentMethodListResult(
          {required final List<PaymentMethodEntry>? paymentMethodList}) =
      _$PaymentMethodListResultImpl;

  factory _PaymentMethodListResult.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodListResultImpl.fromJson;

  @override
  List<PaymentMethodEntry>? get paymentMethodList;

  /// Create a copy of PaymentMethodListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodListResultImplCopyWith<_$PaymentMethodListResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
