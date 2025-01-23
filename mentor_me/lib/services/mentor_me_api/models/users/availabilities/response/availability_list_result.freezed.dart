// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailabilityListResult _$AvailabilityListResultFromJson(
    Map<String, dynamic> json) {
  return _AvailabilityListResult.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityListResult {
  List<AvailabilityEntry>? get availabilityList =>
      throw _privateConstructorUsedError;

  /// Serializes this AvailabilityListResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityListResultCopyWith<AvailabilityListResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityListResultCopyWith<$Res> {
  factory $AvailabilityListResultCopyWith(AvailabilityListResult value,
          $Res Function(AvailabilityListResult) then) =
      _$AvailabilityListResultCopyWithImpl<$Res, AvailabilityListResult>;
  @useResult
  $Res call({List<AvailabilityEntry>? availabilityList});
}

/// @nodoc
class _$AvailabilityListResultCopyWithImpl<$Res,
        $Val extends AvailabilityListResult>
    implements $AvailabilityListResultCopyWith<$Res> {
  _$AvailabilityListResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availabilityList = freezed,
  }) {
    return _then(_value.copyWith(
      availabilityList: freezed == availabilityList
          ? _value.availabilityList
          : availabilityList // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityListResultImplCopyWith<$Res>
    implements $AvailabilityListResultCopyWith<$Res> {
  factory _$$AvailabilityListResultImplCopyWith(
          _$AvailabilityListResultImpl value,
          $Res Function(_$AvailabilityListResultImpl) then) =
      __$$AvailabilityListResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AvailabilityEntry>? availabilityList});
}

/// @nodoc
class __$$AvailabilityListResultImplCopyWithImpl<$Res>
    extends _$AvailabilityListResultCopyWithImpl<$Res,
        _$AvailabilityListResultImpl>
    implements _$$AvailabilityListResultImplCopyWith<$Res> {
  __$$AvailabilityListResultImplCopyWithImpl(
      _$AvailabilityListResultImpl _value,
      $Res Function(_$AvailabilityListResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailabilityListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availabilityList = freezed,
  }) {
    return _then(_$AvailabilityListResultImpl(
      availabilityList: freezed == availabilityList
          ? _value._availabilityList
          : availabilityList // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilityListResultImpl implements _AvailabilityListResult {
  const _$AvailabilityListResultImpl(
      {required final List<AvailabilityEntry>? availabilityList})
      : _availabilityList = availabilityList;

  factory _$AvailabilityListResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityListResultImplFromJson(json);

  final List<AvailabilityEntry>? _availabilityList;
  @override
  List<AvailabilityEntry>? get availabilityList {
    final value = _availabilityList;
    if (value == null) return null;
    if (_availabilityList is EqualUnmodifiableListView)
      return _availabilityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AvailabilityListResult(availabilityList: $availabilityList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityListResultImpl &&
            const DeepCollectionEquality()
                .equals(other._availabilityList, _availabilityList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_availabilityList));

  /// Create a copy of AvailabilityListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityListResultImplCopyWith<_$AvailabilityListResultImpl>
      get copyWith => __$$AvailabilityListResultImplCopyWithImpl<
          _$AvailabilityListResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityListResultImplToJson(
      this,
    );
  }
}

abstract class _AvailabilityListResult implements AvailabilityListResult {
  const factory _AvailabilityListResult(
          {required final List<AvailabilityEntry>? availabilityList}) =
      _$AvailabilityListResultImpl;

  factory _AvailabilityListResult.fromJson(Map<String, dynamic> json) =
      _$AvailabilityListResultImpl.fromJson;

  @override
  List<AvailabilityEntry>? get availabilityList;

  /// Create a copy of AvailabilityListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityListResultImplCopyWith<_$AvailabilityListResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
