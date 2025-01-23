// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JWTResponse _$JWTResponseFromJson(Map<String, dynamic> json) {
  return _JWTResponse.fromJson(json);
}

/// @nodoc
mixin _$JWTResponse {
  String get jwt => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this JWTResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JWTResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JWTResponseCopyWith<JWTResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JWTResponseCopyWith<$Res> {
  factory $JWTResponseCopyWith(
          JWTResponse value, $Res Function(JWTResponse) then) =
      _$JWTResponseCopyWithImpl<$Res, JWTResponse>;
  @useResult
  $Res call({String jwt, String refreshToken, int expiresIn});
}

/// @nodoc
class _$JWTResponseCopyWithImpl<$Res, $Val extends JWTResponse>
    implements $JWTResponseCopyWith<$Res> {
  _$JWTResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JWTResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
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
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JWTResponseImplCopyWith<$Res>
    implements $JWTResponseCopyWith<$Res> {
  factory _$$JWTResponseImplCopyWith(
          _$JWTResponseImpl value, $Res Function(_$JWTResponseImpl) then) =
      __$$JWTResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jwt, String refreshToken, int expiresIn});
}

/// @nodoc
class __$$JWTResponseImplCopyWithImpl<$Res>
    extends _$JWTResponseCopyWithImpl<$Res, _$JWTResponseImpl>
    implements _$$JWTResponseImplCopyWith<$Res> {
  __$$JWTResponseImplCopyWithImpl(
      _$JWTResponseImpl _value, $Res Function(_$JWTResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of JWTResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
  }) {
    return _then(_$JWTResponseImpl(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JWTResponseImpl implements _JWTResponse {
  const _$JWTResponseImpl(
      {required this.jwt, required this.refreshToken, required this.expiresIn});

  factory _$JWTResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JWTResponseImplFromJson(json);

  @override
  final String jwt;
  @override
  final String refreshToken;
  @override
  final int expiresIn;

  @override
  String toString() {
    return 'JWTResponse(jwt: $jwt, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JWTResponseImpl &&
            (identical(other.jwt, jwt) || other.jwt == jwt) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jwt, refreshToken, expiresIn);

  /// Create a copy of JWTResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JWTResponseImplCopyWith<_$JWTResponseImpl> get copyWith =>
      __$$JWTResponseImplCopyWithImpl<_$JWTResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JWTResponseImplToJson(
      this,
    );
  }
}

abstract class _JWTResponse implements JWTResponse {
  const factory _JWTResponse(
      {required final String jwt,
      required final String refreshToken,
      required final int expiresIn}) = _$JWTResponseImpl;

  factory _JWTResponse.fromJson(Map<String, dynamic> json) =
      _$JWTResponseImpl.fromJson;

  @override
  String get jwt;
  @override
  String get refreshToken;
  @override
  int get expiresIn;

  /// Create a copy of JWTResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JWTResponseImplCopyWith<_$JWTResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
