// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonId _$LessonIdFromJson(Map<String, dynamic> json) {
  return _LessonId.fromJson(json);
}

/// @nodoc
mixin _$LessonId {
  String get lessonId => throw _privateConstructorUsedError;

  /// Serializes this LessonId to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonIdCopyWith<LessonId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonIdCopyWith<$Res> {
  factory $LessonIdCopyWith(LessonId value, $Res Function(LessonId) then) =
      _$LessonIdCopyWithImpl<$Res, LessonId>;
  @useResult
  $Res call({String lessonId});
}

/// @nodoc
class _$LessonIdCopyWithImpl<$Res, $Val extends LessonId>
    implements $LessonIdCopyWith<$Res> {
  _$LessonIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonIdImplCopyWith<$Res>
    implements $LessonIdCopyWith<$Res> {
  factory _$$LessonIdImplCopyWith(
          _$LessonIdImpl value, $Res Function(_$LessonIdImpl) then) =
      __$$LessonIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lessonId});
}

/// @nodoc
class __$$LessonIdImplCopyWithImpl<$Res>
    extends _$LessonIdCopyWithImpl<$Res, _$LessonIdImpl>
    implements _$$LessonIdImplCopyWith<$Res> {
  __$$LessonIdImplCopyWithImpl(
      _$LessonIdImpl _value, $Res Function(_$LessonIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
  }) {
    return _then(_$LessonIdImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonIdImpl implements _LessonId {
  const _$LessonIdImpl({required this.lessonId});

  factory _$LessonIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonIdImplFromJson(json);

  @override
  final String lessonId;

  @override
  String toString() {
    return 'LessonId(lessonId: $lessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonIdImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lessonId);

  /// Create a copy of LessonId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonIdImplCopyWith<_$LessonIdImpl> get copyWith =>
      __$$LessonIdImplCopyWithImpl<_$LessonIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonIdImplToJson(
      this,
    );
  }
}

abstract class _LessonId implements LessonId {
  const factory _LessonId({required final String lessonId}) = _$LessonIdImpl;

  factory _LessonId.fromJson(Map<String, dynamic> json) =
      _$LessonIdImpl.fromJson;

  @override
  String get lessonId;

  /// Create a copy of LessonId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonIdImplCopyWith<_$LessonIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
