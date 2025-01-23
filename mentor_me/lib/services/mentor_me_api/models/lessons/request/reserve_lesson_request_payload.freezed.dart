// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reserve_lesson_request_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReserveLessonRequestPayload _$ReserveLessonRequestPayloadFromJson(
    Map<String, dynamic> json) {
  return _ReserveLessonRequestPayload.fromJson(json);
}

/// @nodoc
mixin _$ReserveLessonRequestPayload {
  String get tutorId => throw _privateConstructorUsedError;
  String get paymentMethodId => throw _privateConstructorUsedError;
  String get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lessonStartTime')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'lessonEndTime')
  DateTime get endTime => throw _privateConstructorUsedError;

  /// Serializes this ReserveLessonRequestPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReserveLessonRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReserveLessonRequestPayloadCopyWith<ReserveLessonRequestPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReserveLessonRequestPayloadCopyWith<$Res> {
  factory $ReserveLessonRequestPayloadCopyWith(
          ReserveLessonRequestPayload value,
          $Res Function(ReserveLessonRequestPayload) then) =
      _$ReserveLessonRequestPayloadCopyWithImpl<$Res,
          ReserveLessonRequestPayload>;
  @useResult
  $Res call(
      {String tutorId,
      String paymentMethodId,
      String subjectId,
      @JsonKey(name: 'lessonStartTime') DateTime startTime,
      @JsonKey(name: 'lessonEndTime') DateTime endTime});
}

/// @nodoc
class _$ReserveLessonRequestPayloadCopyWithImpl<$Res,
        $Val extends ReserveLessonRequestPayload>
    implements $ReserveLessonRequestPayloadCopyWith<$Res> {
  _$ReserveLessonRequestPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReserveLessonRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tutorId = null,
    Object? paymentMethodId = null,
    Object? subjectId = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodId: null == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReserveLessonRequestPayloadImplCopyWith<$Res>
    implements $ReserveLessonRequestPayloadCopyWith<$Res> {
  factory _$$ReserveLessonRequestPayloadImplCopyWith(
          _$ReserveLessonRequestPayloadImpl value,
          $Res Function(_$ReserveLessonRequestPayloadImpl) then) =
      __$$ReserveLessonRequestPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tutorId,
      String paymentMethodId,
      String subjectId,
      @JsonKey(name: 'lessonStartTime') DateTime startTime,
      @JsonKey(name: 'lessonEndTime') DateTime endTime});
}

/// @nodoc
class __$$ReserveLessonRequestPayloadImplCopyWithImpl<$Res>
    extends _$ReserveLessonRequestPayloadCopyWithImpl<$Res,
        _$ReserveLessonRequestPayloadImpl>
    implements _$$ReserveLessonRequestPayloadImplCopyWith<$Res> {
  __$$ReserveLessonRequestPayloadImplCopyWithImpl(
      _$ReserveLessonRequestPayloadImpl _value,
      $Res Function(_$ReserveLessonRequestPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReserveLessonRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tutorId = null,
    Object? paymentMethodId = null,
    Object? subjectId = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$ReserveLessonRequestPayloadImpl(
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodId: null == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReserveLessonRequestPayloadImpl
    implements _ReserveLessonRequestPayload {
  const _$ReserveLessonRequestPayloadImpl(
      {required this.tutorId,
      required this.paymentMethodId,
      required this.subjectId,
      @JsonKey(name: 'lessonStartTime') required this.startTime,
      @JsonKey(name: 'lessonEndTime') required this.endTime});

  factory _$ReserveLessonRequestPayloadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReserveLessonRequestPayloadImplFromJson(json);

  @override
  final String tutorId;
  @override
  final String paymentMethodId;
  @override
  final String subjectId;
  @override
  @JsonKey(name: 'lessonStartTime')
  final DateTime startTime;
  @override
  @JsonKey(name: 'lessonEndTime')
  final DateTime endTime;

  @override
  String toString() {
    return 'ReserveLessonRequestPayload(tutorId: $tutorId, paymentMethodId: $paymentMethodId, subjectId: $subjectId, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReserveLessonRequestPayloadImpl &&
            (identical(other.tutorId, tutorId) || other.tutorId == tutorId) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, tutorId, paymentMethodId, subjectId, startTime, endTime);

  /// Create a copy of ReserveLessonRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReserveLessonRequestPayloadImplCopyWith<_$ReserveLessonRequestPayloadImpl>
      get copyWith => __$$ReserveLessonRequestPayloadImplCopyWithImpl<
          _$ReserveLessonRequestPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReserveLessonRequestPayloadImplToJson(
      this,
    );
  }
}

abstract class _ReserveLessonRequestPayload
    implements ReserveLessonRequestPayload {
  const factory _ReserveLessonRequestPayload(
          {required final String tutorId,
          required final String paymentMethodId,
          required final String subjectId,
          @JsonKey(name: 'lessonStartTime') required final DateTime startTime,
          @JsonKey(name: 'lessonEndTime') required final DateTime endTime}) =
      _$ReserveLessonRequestPayloadImpl;

  factory _ReserveLessonRequestPayload.fromJson(Map<String, dynamic> json) =
      _$ReserveLessonRequestPayloadImpl.fromJson;

  @override
  String get tutorId;
  @override
  String get paymentMethodId;
  @override
  String get subjectId;
  @override
  @JsonKey(name: 'lessonStartTime')
  DateTime get startTime;
  @override
  @JsonKey(name: 'lessonEndTime')
  DateTime get endTime;

  /// Create a copy of ReserveLessonRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReserveLessonRequestPayloadImplCopyWith<_$ReserveLessonRequestPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
