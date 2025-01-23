// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewPayload _$ReviewPayloadFromJson(Map<String, dynamic> json) {
  return _ReviewPayload.fromJson(json);
}

/// @nodoc
mixin _$ReviewPayload {
  String get lessonId => throw _privateConstructorUsedError;
  String get tutorId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  ReviewVariants get reviewType => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  /// Serializes this ReviewPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewPayloadCopyWith<ReviewPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewPayloadCopyWith<$Res> {
  factory $ReviewPayloadCopyWith(
          ReviewPayload value, $Res Function(ReviewPayload) then) =
      _$ReviewPayloadCopyWithImpl<$Res, ReviewPayload>;
  @useResult
  $Res call(
      {String lessonId,
      String tutorId,
      String studentId,
      ReviewVariants reviewType,
      int rating,
      String comment});
}

/// @nodoc
class _$ReviewPayloadCopyWithImpl<$Res, $Val extends ReviewPayload>
    implements $ReviewPayloadCopyWith<$Res> {
  _$ReviewPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? tutorId = null,
    Object? studentId = null,
    Object? reviewType = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewType: null == reviewType
          ? _value.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewVariants,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewPayloadImplCopyWith<$Res>
    implements $ReviewPayloadCopyWith<$Res> {
  factory _$$ReviewPayloadImplCopyWith(
          _$ReviewPayloadImpl value, $Res Function(_$ReviewPayloadImpl) then) =
      __$$ReviewPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lessonId,
      String tutorId,
      String studentId,
      ReviewVariants reviewType,
      int rating,
      String comment});
}

/// @nodoc
class __$$ReviewPayloadImplCopyWithImpl<$Res>
    extends _$ReviewPayloadCopyWithImpl<$Res, _$ReviewPayloadImpl>
    implements _$$ReviewPayloadImplCopyWith<$Res> {
  __$$ReviewPayloadImplCopyWithImpl(
      _$ReviewPayloadImpl _value, $Res Function(_$ReviewPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? tutorId = null,
    Object? studentId = null,
    Object? reviewType = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_$ReviewPayloadImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewType: null == reviewType
          ? _value.reviewType
          : reviewType // ignore: cast_nullable_to_non_nullable
              as ReviewVariants,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewPayloadImpl implements _ReviewPayload {
  const _$ReviewPayloadImpl(
      {required this.lessonId,
      required this.tutorId,
      required this.studentId,
      required this.reviewType,
      required this.rating,
      required this.comment});

  factory _$ReviewPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewPayloadImplFromJson(json);

  @override
  final String lessonId;
  @override
  final String tutorId;
  @override
  final String studentId;
  @override
  final ReviewVariants reviewType;
  @override
  final int rating;
  @override
  final String comment;

  @override
  String toString() {
    return 'ReviewPayload(lessonId: $lessonId, tutorId: $tutorId, studentId: $studentId, reviewType: $reviewType, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewPayloadImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.tutorId, tutorId) || other.tutorId == tutorId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.reviewType, reviewType) ||
                other.reviewType == reviewType) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, lessonId, tutorId, studentId, reviewType, rating, comment);

  /// Create a copy of ReviewPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewPayloadImplCopyWith<_$ReviewPayloadImpl> get copyWith =>
      __$$ReviewPayloadImplCopyWithImpl<_$ReviewPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewPayloadImplToJson(
      this,
    );
  }
}

abstract class _ReviewPayload implements ReviewPayload {
  const factory _ReviewPayload(
      {required final String lessonId,
      required final String tutorId,
      required final String studentId,
      required final ReviewVariants reviewType,
      required final int rating,
      required final String comment}) = _$ReviewPayloadImpl;

  factory _ReviewPayload.fromJson(Map<String, dynamic> json) =
      _$ReviewPayloadImpl.fromJson;

  @override
  String get lessonId;
  @override
  String get tutorId;
  @override
  String get studentId;
  @override
  ReviewVariants get reviewType;
  @override
  int get rating;
  @override
  String get comment;

  /// Create a copy of ReviewPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewPayloadImplCopyWith<_$ReviewPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
