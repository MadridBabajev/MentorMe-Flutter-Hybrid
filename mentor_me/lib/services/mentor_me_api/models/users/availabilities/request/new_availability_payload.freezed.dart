// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_availability_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewAvailabilityPayload _$NewAvailabilityPayloadFromJson(
    Map<String, dynamic> json) {
  return _NewAvailabilityPayload.fromJson(json);
}

/// @nodoc
mixin _$NewAvailabilityPayload {
  String get fromHours => throw _privateConstructorUsedError;
  String get toHours => throw _privateConstructorUsedError;
  DaysOfTheWeek get dayOfTheWeek => throw _privateConstructorUsedError;

  /// Serializes this NewAvailabilityPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewAvailabilityPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewAvailabilityPayloadCopyWith<NewAvailabilityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAvailabilityPayloadCopyWith<$Res> {
  factory $NewAvailabilityPayloadCopyWith(NewAvailabilityPayload value,
          $Res Function(NewAvailabilityPayload) then) =
      _$NewAvailabilityPayloadCopyWithImpl<$Res, NewAvailabilityPayload>;
  @useResult
  $Res call({String fromHours, String toHours, DaysOfTheWeek dayOfTheWeek});
}

/// @nodoc
class _$NewAvailabilityPayloadCopyWithImpl<$Res,
        $Val extends NewAvailabilityPayload>
    implements $NewAvailabilityPayloadCopyWith<$Res> {
  _$NewAvailabilityPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewAvailabilityPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromHours = null,
    Object? toHours = null,
    Object? dayOfTheWeek = null,
  }) {
    return _then(_value.copyWith(
      fromHours: null == fromHours
          ? _value.fromHours
          : fromHours // ignore: cast_nullable_to_non_nullable
              as String,
      toHours: null == toHours
          ? _value.toHours
          : toHours // ignore: cast_nullable_to_non_nullable
              as String,
      dayOfTheWeek: null == dayOfTheWeek
          ? _value.dayOfTheWeek
          : dayOfTheWeek // ignore: cast_nullable_to_non_nullable
              as DaysOfTheWeek,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewAvailabilityPayloadImplCopyWith<$Res>
    implements $NewAvailabilityPayloadCopyWith<$Res> {
  factory _$$NewAvailabilityPayloadImplCopyWith(
          _$NewAvailabilityPayloadImpl value,
          $Res Function(_$NewAvailabilityPayloadImpl) then) =
      __$$NewAvailabilityPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fromHours, String toHours, DaysOfTheWeek dayOfTheWeek});
}

/// @nodoc
class __$$NewAvailabilityPayloadImplCopyWithImpl<$Res>
    extends _$NewAvailabilityPayloadCopyWithImpl<$Res,
        _$NewAvailabilityPayloadImpl>
    implements _$$NewAvailabilityPayloadImplCopyWith<$Res> {
  __$$NewAvailabilityPayloadImplCopyWithImpl(
      _$NewAvailabilityPayloadImpl _value,
      $Res Function(_$NewAvailabilityPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewAvailabilityPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromHours = null,
    Object? toHours = null,
    Object? dayOfTheWeek = null,
  }) {
    return _then(_$NewAvailabilityPayloadImpl(
      fromHours: null == fromHours
          ? _value.fromHours
          : fromHours // ignore: cast_nullable_to_non_nullable
              as String,
      toHours: null == toHours
          ? _value.toHours
          : toHours // ignore: cast_nullable_to_non_nullable
              as String,
      dayOfTheWeek: null == dayOfTheWeek
          ? _value.dayOfTheWeek
          : dayOfTheWeek // ignore: cast_nullable_to_non_nullable
              as DaysOfTheWeek,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewAvailabilityPayloadImpl implements _NewAvailabilityPayload {
  const _$NewAvailabilityPayloadImpl(
      {required this.fromHours,
      required this.toHours,
      required this.dayOfTheWeek});

  factory _$NewAvailabilityPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewAvailabilityPayloadImplFromJson(json);

  @override
  final String fromHours;
  @override
  final String toHours;
  @override
  final DaysOfTheWeek dayOfTheWeek;

  @override
  String toString() {
    return 'NewAvailabilityPayload(fromHours: $fromHours, toHours: $toHours, dayOfTheWeek: $dayOfTheWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewAvailabilityPayloadImpl &&
            (identical(other.fromHours, fromHours) ||
                other.fromHours == fromHours) &&
            (identical(other.toHours, toHours) || other.toHours == toHours) &&
            (identical(other.dayOfTheWeek, dayOfTheWeek) ||
                other.dayOfTheWeek == dayOfTheWeek));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fromHours, toHours, dayOfTheWeek);

  /// Create a copy of NewAvailabilityPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewAvailabilityPayloadImplCopyWith<_$NewAvailabilityPayloadImpl>
      get copyWith => __$$NewAvailabilityPayloadImplCopyWithImpl<
          _$NewAvailabilityPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewAvailabilityPayloadImplToJson(
      this,
    );
  }
}

abstract class _NewAvailabilityPayload implements NewAvailabilityPayload {
  const factory _NewAvailabilityPayload(
          {required final String fromHours,
          required final String toHours,
          required final DaysOfTheWeek dayOfTheWeek}) =
      _$NewAvailabilityPayloadImpl;

  factory _NewAvailabilityPayload.fromJson(Map<String, dynamic> json) =
      _$NewAvailabilityPayloadImpl.fromJson;

  @override
  String get fromHours;
  @override
  String get toHours;
  @override
  DaysOfTheWeek get dayOfTheWeek;

  /// Create a copy of NewAvailabilityPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewAvailabilityPayloadImplCopyWith<_$NewAvailabilityPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
