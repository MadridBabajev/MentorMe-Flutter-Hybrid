// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshTokenPayload _$RefreshTokenPayloadFromJson(Map<String, dynamic> json) {
  return _RefreshTokenPayload.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenPayload {
  String get jwt => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenPayloadCopyWith<RefreshTokenPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenPayloadCopyWith<$Res> {
  factory $RefreshTokenPayloadCopyWith(
          RefreshTokenPayload value, $Res Function(RefreshTokenPayload) then) =
      _$RefreshTokenPayloadCopyWithImpl<$Res, RefreshTokenPayload>;
  @useResult
  $Res call({String jwt, String refreshToken});
}

/// @nodoc
class _$RefreshTokenPayloadCopyWithImpl<$Res, $Val extends RefreshTokenPayload>
    implements $RefreshTokenPayloadCopyWith<$Res> {
  _$RefreshTokenPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenPayloadImplCopyWith<$Res>
    implements $RefreshTokenPayloadCopyWith<$Res> {
  factory _$$RefreshTokenPayloadImplCopyWith(_$RefreshTokenPayloadImpl value,
          $Res Function(_$RefreshTokenPayloadImpl) then) =
      __$$RefreshTokenPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jwt, String refreshToken});
}

/// @nodoc
class __$$RefreshTokenPayloadImplCopyWithImpl<$Res>
    extends _$RefreshTokenPayloadCopyWithImpl<$Res, _$RefreshTokenPayloadImpl>
    implements _$$RefreshTokenPayloadImplCopyWith<$Res> {
  __$$RefreshTokenPayloadImplCopyWithImpl(_$RefreshTokenPayloadImpl _value,
      $Res Function(_$RefreshTokenPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenPayloadImpl(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenPayloadImpl implements _RefreshTokenPayload {
  const _$RefreshTokenPayloadImpl(
      {required this.jwt, required this.refreshToken});

  factory _$RefreshTokenPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenPayloadImplFromJson(json);

  @override
  final String jwt;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenPayload(jwt: $jwt, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenPayloadImpl &&
            (identical(other.jwt, jwt) || other.jwt == jwt) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jwt, refreshToken);

  /// Create a copy of RefreshTokenPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenPayloadImplCopyWith<_$RefreshTokenPayloadImpl> get copyWith =>
      __$$RefreshTokenPayloadImplCopyWithImpl<_$RefreshTokenPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenPayloadImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenPayload implements RefreshTokenPayload {
  const factory _RefreshTokenPayload(
      {required final String jwt,
      required final String refreshToken}) = _$RefreshTokenPayloadImpl;

  factory _RefreshTokenPayload.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenPayloadImpl.fromJson;

  @override
  String get jwt;
  @override
  String get refreshToken;

  /// Create a copy of RefreshTokenPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenPayloadImplCopyWith<_$RefreshTokenPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
