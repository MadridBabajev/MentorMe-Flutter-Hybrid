// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_name_list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectNameListResult _$SubjectNameListResultFromJson(
    Map<String, dynamic> json) {
  return _SubjectNameListResult.fromJson(json);
}

/// @nodoc
mixin _$SubjectNameListResult {
  List<SubjectNameEntry>? get subjectsList =>
      throw _privateConstructorUsedError;

  /// Serializes this SubjectNameListResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectNameListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectNameListResultCopyWith<SubjectNameListResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectNameListResultCopyWith<$Res> {
  factory $SubjectNameListResultCopyWith(SubjectNameListResult value,
          $Res Function(SubjectNameListResult) then) =
      _$SubjectNameListResultCopyWithImpl<$Res, SubjectNameListResult>;
  @useResult
  $Res call({List<SubjectNameEntry>? subjectsList});
}

/// @nodoc
class _$SubjectNameListResultCopyWithImpl<$Res,
        $Val extends SubjectNameListResult>
    implements $SubjectNameListResultCopyWith<$Res> {
  _$SubjectNameListResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectNameListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectsList = freezed,
  }) {
    return _then(_value.copyWith(
      subjectsList: freezed == subjectsList
          ? _value.subjectsList
          : subjectsList // ignore: cast_nullable_to_non_nullable
              as List<SubjectNameEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectNameListResultImplCopyWith<$Res>
    implements $SubjectNameListResultCopyWith<$Res> {
  factory _$$SubjectNameListResultImplCopyWith(
          _$SubjectNameListResultImpl value,
          $Res Function(_$SubjectNameListResultImpl) then) =
      __$$SubjectNameListResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SubjectNameEntry>? subjectsList});
}

/// @nodoc
class __$$SubjectNameListResultImplCopyWithImpl<$Res>
    extends _$SubjectNameListResultCopyWithImpl<$Res,
        _$SubjectNameListResultImpl>
    implements _$$SubjectNameListResultImplCopyWith<$Res> {
  __$$SubjectNameListResultImplCopyWithImpl(_$SubjectNameListResultImpl _value,
      $Res Function(_$SubjectNameListResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectNameListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectsList = freezed,
  }) {
    return _then(_$SubjectNameListResultImpl(
      subjectsList: freezed == subjectsList
          ? _value._subjectsList
          : subjectsList // ignore: cast_nullable_to_non_nullable
              as List<SubjectNameEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectNameListResultImpl implements _SubjectNameListResult {
  const _$SubjectNameListResultImpl(
      {required final List<SubjectNameEntry>? subjectsList})
      : _subjectsList = subjectsList;

  factory _$SubjectNameListResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectNameListResultImplFromJson(json);

  final List<SubjectNameEntry>? _subjectsList;
  @override
  List<SubjectNameEntry>? get subjectsList {
    final value = _subjectsList;
    if (value == null) return null;
    if (_subjectsList is EqualUnmodifiableListView) return _subjectsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubjectNameListResult(subjectsList: $subjectsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectNameListResultImpl &&
            const DeepCollectionEquality()
                .equals(other._subjectsList, _subjectsList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_subjectsList));

  /// Create a copy of SubjectNameListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectNameListResultImplCopyWith<_$SubjectNameListResultImpl>
      get copyWith => __$$SubjectNameListResultImplCopyWithImpl<
          _$SubjectNameListResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectNameListResultImplToJson(
      this,
    );
  }
}

abstract class _SubjectNameListResult implements SubjectNameListResult {
  const factory _SubjectNameListResult(
          {required final List<SubjectNameEntry>? subjectsList}) =
      _$SubjectNameListResultImpl;

  factory _SubjectNameListResult.fromJson(Map<String, dynamic> json) =
      _$SubjectNameListResultImpl.fromJson;

  @override
  List<SubjectNameEntry>? get subjectsList;

  /// Create a copy of SubjectNameListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectNameListResultImplCopyWith<_$SubjectNameListResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
