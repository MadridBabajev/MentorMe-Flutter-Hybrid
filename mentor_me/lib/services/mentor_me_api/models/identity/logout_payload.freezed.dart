// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogoutPayload _$LogoutPayloadFromJson(Map<String, dynamic> json) {
  return _LogoutPayload.fromJson(json);
}

/// @nodoc
mixin _$LogoutPayload {
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this LogoutPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogoutPayloadCopyWith<LogoutPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutPayloadCopyWith<$Res> {
  factory $LogoutPayloadCopyWith(
          LogoutPayload value, $Res Function(LogoutPayload) then) =
      _$LogoutPayloadCopyWithImpl<$Res, LogoutPayload>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$LogoutPayloadCopyWithImpl<$Res, $Val extends LogoutPayload>
    implements $LogoutPayloadCopyWith<$Res> {
  _$LogoutPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogoutPayloadImplCopyWith<$Res>
    implements $LogoutPayloadCopyWith<$Res> {
  factory _$$LogoutPayloadImplCopyWith(
          _$LogoutPayloadImpl value, $Res Function(_$LogoutPayloadImpl) then) =
      __$$LogoutPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$LogoutPayloadImplCopyWithImpl<$Res>
    extends _$LogoutPayloadCopyWithImpl<$Res, _$LogoutPayloadImpl>
    implements _$$LogoutPayloadImplCopyWith<$Res> {
  __$$LogoutPayloadImplCopyWithImpl(
      _$LogoutPayloadImpl _value, $Res Function(_$LogoutPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$LogoutPayloadImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogoutPayloadImpl implements _LogoutPayload {
  const _$LogoutPayloadImpl({required this.refreshToken});

  factory _$LogoutPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogoutPayloadImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'LogoutPayload(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutPayloadImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of LogoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutPayloadImplCopyWith<_$LogoutPayloadImpl> get copyWith =>
      __$$LogoutPayloadImplCopyWithImpl<_$LogoutPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogoutPayloadImplToJson(
      this,
    );
  }
}

abstract class _LogoutPayload implements LogoutPayload {
  const factory _LogoutPayload({required final String refreshToken}) =
      _$LogoutPayloadImpl;

  factory _LogoutPayload.fromJson(Map<String, dynamic> json) =
      _$LogoutPayloadImpl.fromJson;

  @override
  String get refreshToken;

  /// Create a copy of LogoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogoutPayloadImplCopyWith<_$LogoutPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
