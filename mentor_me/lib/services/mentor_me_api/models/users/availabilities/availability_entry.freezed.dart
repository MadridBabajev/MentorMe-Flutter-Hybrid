// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailabilityEntry _$AvailabilityEntryFromJson(Map<String, dynamic> json) {
  return _AvailabilityEntry.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityEntry {
  String get id => throw _privateConstructorUsedError;
  String get fromHours => throw _privateConstructorUsedError;
  String get toHours => throw _privateConstructorUsedError;
  DaysOfTheWeek get dayOfTheWeek => throw _privateConstructorUsedError;

  /// Serializes this AvailabilityEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityEntryCopyWith<AvailabilityEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityEntryCopyWith<$Res> {
  factory $AvailabilityEntryCopyWith(
          AvailabilityEntry value, $Res Function(AvailabilityEntry) then) =
      _$AvailabilityEntryCopyWithImpl<$Res, AvailabilityEntry>;
  @useResult
  $Res call(
      {String id,
      String fromHours,
      String toHours,
      DaysOfTheWeek dayOfTheWeek});
}

/// @nodoc
class _$AvailabilityEntryCopyWithImpl<$Res, $Val extends AvailabilityEntry>
    implements $AvailabilityEntryCopyWith<$Res> {
  _$AvailabilityEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromHours = null,
    Object? toHours = null,
    Object? dayOfTheWeek = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$AvailabilityEntryImplCopyWith<$Res>
    implements $AvailabilityEntryCopyWith<$Res> {
  factory _$$AvailabilityEntryImplCopyWith(_$AvailabilityEntryImpl value,
          $Res Function(_$AvailabilityEntryImpl) then) =
      __$$AvailabilityEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fromHours,
      String toHours,
      DaysOfTheWeek dayOfTheWeek});
}

/// @nodoc
class __$$AvailabilityEntryImplCopyWithImpl<$Res>
    extends _$AvailabilityEntryCopyWithImpl<$Res, _$AvailabilityEntryImpl>
    implements _$$AvailabilityEntryImplCopyWith<$Res> {
  __$$AvailabilityEntryImplCopyWithImpl(_$AvailabilityEntryImpl _value,
      $Res Function(_$AvailabilityEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailabilityEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromHours = null,
    Object? toHours = null,
    Object? dayOfTheWeek = null,
  }) {
    return _then(_$AvailabilityEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$AvailabilityEntryImpl implements _AvailabilityEntry {
  const _$AvailabilityEntryImpl(
      {required this.id,
      required this.fromHours,
      required this.toHours,
      required this.dayOfTheWeek});

  factory _$AvailabilityEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String fromHours;
  @override
  final String toHours;
  @override
  final DaysOfTheWeek dayOfTheWeek;

  @override
  String toString() {
    return 'AvailabilityEntry(id: $id, fromHours: $fromHours, toHours: $toHours, dayOfTheWeek: $dayOfTheWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fromHours, fromHours) ||
                other.fromHours == fromHours) &&
            (identical(other.toHours, toHours) || other.toHours == toHours) &&
            (identical(other.dayOfTheWeek, dayOfTheWeek) ||
                other.dayOfTheWeek == dayOfTheWeek));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fromHours, toHours, dayOfTheWeek);

  /// Create a copy of AvailabilityEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityEntryImplCopyWith<_$AvailabilityEntryImpl> get copyWith =>
      __$$AvailabilityEntryImplCopyWithImpl<_$AvailabilityEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityEntryImplToJson(
      this,
    );
  }
}

abstract class _AvailabilityEntry implements AvailabilityEntry {
  const factory _AvailabilityEntry(
      {required final String id,
      required final String fromHours,
      required final String toHours,
      required final DaysOfTheWeek dayOfTheWeek}) = _$AvailabilityEntryImpl;

  factory _AvailabilityEntry.fromJson(Map<String, dynamic> json) =
      _$AvailabilityEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get fromHours;
  @override
  String get toHours;
  @override
  DaysOfTheWeek get dayOfTheWeek;

  /// Create a copy of AvailabilityEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityEntryImplCopyWith<_$AvailabilityEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
