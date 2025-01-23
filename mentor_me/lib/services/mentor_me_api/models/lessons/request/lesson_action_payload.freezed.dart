// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_action_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonActionPayload _$LessonActionPayloadFromJson(Map<String, dynamic> json) {
  return _LessonActionPayload.fromJson(json);
}

/// @nodoc
mixin _$LessonActionPayload {
  String get lessonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tutorDecision')
  LessonActions get lessonAction => throw _privateConstructorUsedError;

  /// Serializes this LessonActionPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonActionPayloadCopyWith<LessonActionPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonActionPayloadCopyWith<$Res> {
  factory $LessonActionPayloadCopyWith(
          LessonActionPayload value, $Res Function(LessonActionPayload) then) =
      _$LessonActionPayloadCopyWithImpl<$Res, LessonActionPayload>;
  @useResult
  $Res call(
      {String lessonId,
      @JsonKey(name: 'tutorDecision') LessonActions lessonAction});
}

/// @nodoc
class _$LessonActionPayloadCopyWithImpl<$Res, $Val extends LessonActionPayload>
    implements $LessonActionPayloadCopyWith<$Res> {
  _$LessonActionPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? lessonAction = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonAction: null == lessonAction
          ? _value.lessonAction
          : lessonAction // ignore: cast_nullable_to_non_nullable
              as LessonActions,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonActionPayloadImplCopyWith<$Res>
    implements $LessonActionPayloadCopyWith<$Res> {
  factory _$$LessonActionPayloadImplCopyWith(_$LessonActionPayloadImpl value,
          $Res Function(_$LessonActionPayloadImpl) then) =
      __$$LessonActionPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lessonId,
      @JsonKey(name: 'tutorDecision') LessonActions lessonAction});
}

/// @nodoc
class __$$LessonActionPayloadImplCopyWithImpl<$Res>
    extends _$LessonActionPayloadCopyWithImpl<$Res, _$LessonActionPayloadImpl>
    implements _$$LessonActionPayloadImplCopyWith<$Res> {
  __$$LessonActionPayloadImplCopyWithImpl(_$LessonActionPayloadImpl _value,
      $Res Function(_$LessonActionPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? lessonAction = null,
  }) {
    return _then(_$LessonActionPayloadImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonAction: null == lessonAction
          ? _value.lessonAction
          : lessonAction // ignore: cast_nullable_to_non_nullable
              as LessonActions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonActionPayloadImpl implements _LessonActionPayload {
  const _$LessonActionPayloadImpl(
      {required this.lessonId,
      @JsonKey(name: 'tutorDecision') required this.lessonAction});

  factory _$LessonActionPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonActionPayloadImplFromJson(json);

  @override
  final String lessonId;
  @override
  @JsonKey(name: 'tutorDecision')
  final LessonActions lessonAction;

  @override
  String toString() {
    return 'LessonActionPayload(lessonId: $lessonId, lessonAction: $lessonAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonActionPayloadImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.lessonAction, lessonAction) ||
                other.lessonAction == lessonAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lessonId, lessonAction);

  /// Create a copy of LessonActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonActionPayloadImplCopyWith<_$LessonActionPayloadImpl> get copyWith =>
      __$$LessonActionPayloadImplCopyWithImpl<_$LessonActionPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonActionPayloadImplToJson(
      this,
    );
  }
}

abstract class _LessonActionPayload implements LessonActionPayload {
  const factory _LessonActionPayload(
      {required final String lessonId,
      @JsonKey(name: 'tutorDecision')
      required final LessonActions lessonAction}) = _$LessonActionPayloadImpl;

  factory _LessonActionPayload.fromJson(Map<String, dynamic> json) =
      _$LessonActionPayloadImpl.fromJson;

  @override
  String get lessonId;
  @override
  @JsonKey(name: 'tutorDecision')
  LessonActions get lessonAction;

  /// Create a copy of LessonActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonActionPayloadImplCopyWith<_$LessonActionPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
