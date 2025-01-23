// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_details_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonDetailsResult _$LessonDetailsResultFromJson(Map<String, dynamic> json) {
  return _LessonDetailsResult.fromJson(json);
}

/// @nodoc
mixin _$LessonDetailsResult {
  String get id => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  LessonStates get lessonState => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get viewedByTutor => throw _privateConstructorUsedError;
  bool get userCanWriteReview => throw _privateConstructorUsedError;
  LessonPaymentMethod get studentPaymentMethod =>
      throw _privateConstructorUsedError;
  SubjectListEntry get subject => throw _privateConstructorUsedError;
  ProfileCardData get lessonStudent => throw _privateConstructorUsedError;
  ProfileCardData get lessonTutor => throw _privateConstructorUsedError;
  List<LessonTag> get tags => throw _privateConstructorUsedError;

  /// Serializes this LessonDetailsResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonDetailsResultCopyWith<LessonDetailsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonDetailsResultCopyWith<$Res> {
  factory $LessonDetailsResultCopyWith(
          LessonDetailsResult value, $Res Function(LessonDetailsResult) then) =
      _$LessonDetailsResultCopyWithImpl<$Res, LessonDetailsResult>;
  @useResult
  $Res call(
      {String id,
      String paymentId,
      DateTime startTime,
      DateTime endTime,
      LessonStates lessonState,
      double price,
      bool viewedByTutor,
      bool userCanWriteReview,
      LessonPaymentMethod studentPaymentMethod,
      SubjectListEntry subject,
      ProfileCardData lessonStudent,
      ProfileCardData lessonTutor,
      List<LessonTag> tags});

  $LessonPaymentMethodCopyWith<$Res> get studentPaymentMethod;
  $SubjectListEntryCopyWith<$Res> get subject;
  $ProfileCardDataCopyWith<$Res> get lessonStudent;
  $ProfileCardDataCopyWith<$Res> get lessonTutor;
}

/// @nodoc
class _$LessonDetailsResultCopyWithImpl<$Res, $Val extends LessonDetailsResult>
    implements $LessonDetailsResultCopyWith<$Res> {
  _$LessonDetailsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? lessonState = null,
    Object? price = null,
    Object? viewedByTutor = null,
    Object? userCanWriteReview = null,
    Object? studentPaymentMethod = null,
    Object? subject = null,
    Object? lessonStudent = null,
    Object? lessonTutor = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonState: null == lessonState
          ? _value.lessonState
          : lessonState // ignore: cast_nullable_to_non_nullable
              as LessonStates,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      viewedByTutor: null == viewedByTutor
          ? _value.viewedByTutor
          : viewedByTutor // ignore: cast_nullable_to_non_nullable
              as bool,
      userCanWriteReview: null == userCanWriteReview
          ? _value.userCanWriteReview
          : userCanWriteReview // ignore: cast_nullable_to_non_nullable
              as bool,
      studentPaymentMethod: null == studentPaymentMethod
          ? _value.studentPaymentMethod
          : studentPaymentMethod // ignore: cast_nullable_to_non_nullable
              as LessonPaymentMethod,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectListEntry,
      lessonStudent: null == lessonStudent
          ? _value.lessonStudent
          : lessonStudent // ignore: cast_nullable_to_non_nullable
              as ProfileCardData,
      lessonTutor: null == lessonTutor
          ? _value.lessonTutor
          : lessonTutor // ignore: cast_nullable_to_non_nullable
              as ProfileCardData,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<LessonTag>,
    ) as $Val);
  }

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LessonPaymentMethodCopyWith<$Res> get studentPaymentMethod {
    return $LessonPaymentMethodCopyWith<$Res>(_value.studentPaymentMethod,
        (value) {
      return _then(_value.copyWith(studentPaymentMethod: value) as $Val);
    });
  }

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectListEntryCopyWith<$Res> get subject {
    return $SubjectListEntryCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCardDataCopyWith<$Res> get lessonStudent {
    return $ProfileCardDataCopyWith<$Res>(_value.lessonStudent, (value) {
      return _then(_value.copyWith(lessonStudent: value) as $Val);
    });
  }

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCardDataCopyWith<$Res> get lessonTutor {
    return $ProfileCardDataCopyWith<$Res>(_value.lessonTutor, (value) {
      return _then(_value.copyWith(lessonTutor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonDetailsResultImplCopyWith<$Res>
    implements $LessonDetailsResultCopyWith<$Res> {
  factory _$$LessonDetailsResultImplCopyWith(_$LessonDetailsResultImpl value,
          $Res Function(_$LessonDetailsResultImpl) then) =
      __$$LessonDetailsResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String paymentId,
      DateTime startTime,
      DateTime endTime,
      LessonStates lessonState,
      double price,
      bool viewedByTutor,
      bool userCanWriteReview,
      LessonPaymentMethod studentPaymentMethod,
      SubjectListEntry subject,
      ProfileCardData lessonStudent,
      ProfileCardData lessonTutor,
      List<LessonTag> tags});

  @override
  $LessonPaymentMethodCopyWith<$Res> get studentPaymentMethod;
  @override
  $SubjectListEntryCopyWith<$Res> get subject;
  @override
  $ProfileCardDataCopyWith<$Res> get lessonStudent;
  @override
  $ProfileCardDataCopyWith<$Res> get lessonTutor;
}

/// @nodoc
class __$$LessonDetailsResultImplCopyWithImpl<$Res>
    extends _$LessonDetailsResultCopyWithImpl<$Res, _$LessonDetailsResultImpl>
    implements _$$LessonDetailsResultImplCopyWith<$Res> {
  __$$LessonDetailsResultImplCopyWithImpl(_$LessonDetailsResultImpl _value,
      $Res Function(_$LessonDetailsResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? lessonState = null,
    Object? price = null,
    Object? viewedByTutor = null,
    Object? userCanWriteReview = null,
    Object? studentPaymentMethod = null,
    Object? subject = null,
    Object? lessonStudent = null,
    Object? lessonTutor = null,
    Object? tags = null,
  }) {
    return _then(_$LessonDetailsResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonState: null == lessonState
          ? _value.lessonState
          : lessonState // ignore: cast_nullable_to_non_nullable
              as LessonStates,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      viewedByTutor: null == viewedByTutor
          ? _value.viewedByTutor
          : viewedByTutor // ignore: cast_nullable_to_non_nullable
              as bool,
      userCanWriteReview: null == userCanWriteReview
          ? _value.userCanWriteReview
          : userCanWriteReview // ignore: cast_nullable_to_non_nullable
              as bool,
      studentPaymentMethod: null == studentPaymentMethod
          ? _value.studentPaymentMethod
          : studentPaymentMethod // ignore: cast_nullable_to_non_nullable
              as LessonPaymentMethod,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectListEntry,
      lessonStudent: null == lessonStudent
          ? _value.lessonStudent
          : lessonStudent // ignore: cast_nullable_to_non_nullable
              as ProfileCardData,
      lessonTutor: null == lessonTutor
          ? _value.lessonTutor
          : lessonTutor // ignore: cast_nullable_to_non_nullable
              as ProfileCardData,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<LessonTag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonDetailsResultImpl implements _LessonDetailsResult {
  const _$LessonDetailsResultImpl(
      {required this.id,
      required this.paymentId,
      required this.startTime,
      required this.endTime,
      required this.lessonState,
      required this.price,
      required this.viewedByTutor,
      required this.userCanWriteReview,
      required this.studentPaymentMethod,
      required this.subject,
      required this.lessonStudent,
      required this.lessonTutor,
      required final List<LessonTag> tags})
      : _tags = tags;

  factory _$LessonDetailsResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonDetailsResultImplFromJson(json);

  @override
  final String id;
  @override
  final String paymentId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final LessonStates lessonState;
  @override
  final double price;
  @override
  final bool viewedByTutor;
  @override
  final bool userCanWriteReview;
  @override
  final LessonPaymentMethod studentPaymentMethod;
  @override
  final SubjectListEntry subject;
  @override
  final ProfileCardData lessonStudent;
  @override
  final ProfileCardData lessonTutor;
  final List<LessonTag> _tags;
  @override
  List<LessonTag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'LessonDetailsResult(id: $id, paymentId: $paymentId, startTime: $startTime, endTime: $endTime, lessonState: $lessonState, price: $price, viewedByTutor: $viewedByTutor, userCanWriteReview: $userCanWriteReview, studentPaymentMethod: $studentPaymentMethod, subject: $subject, lessonStudent: $lessonStudent, lessonTutor: $lessonTutor, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonDetailsResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.lessonState, lessonState) ||
                other.lessonState == lessonState) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.viewedByTutor, viewedByTutor) ||
                other.viewedByTutor == viewedByTutor) &&
            (identical(other.userCanWriteReview, userCanWriteReview) ||
                other.userCanWriteReview == userCanWriteReview) &&
            (identical(other.studentPaymentMethod, studentPaymentMethod) ||
                other.studentPaymentMethod == studentPaymentMethod) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.lessonStudent, lessonStudent) ||
                other.lessonStudent == lessonStudent) &&
            (identical(other.lessonTutor, lessonTutor) ||
                other.lessonTutor == lessonTutor) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentId,
      startTime,
      endTime,
      lessonState,
      price,
      viewedByTutor,
      userCanWriteReview,
      studentPaymentMethod,
      subject,
      lessonStudent,
      lessonTutor,
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonDetailsResultImplCopyWith<_$LessonDetailsResultImpl> get copyWith =>
      __$$LessonDetailsResultImplCopyWithImpl<_$LessonDetailsResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonDetailsResultImplToJson(
      this,
    );
  }
}

abstract class _LessonDetailsResult implements LessonDetailsResult {
  const factory _LessonDetailsResult(
      {required final String id,
      required final String paymentId,
      required final DateTime startTime,
      required final DateTime endTime,
      required final LessonStates lessonState,
      required final double price,
      required final bool viewedByTutor,
      required final bool userCanWriteReview,
      required final LessonPaymentMethod studentPaymentMethod,
      required final SubjectListEntry subject,
      required final ProfileCardData lessonStudent,
      required final ProfileCardData lessonTutor,
      required final List<LessonTag> tags}) = _$LessonDetailsResultImpl;

  factory _LessonDetailsResult.fromJson(Map<String, dynamic> json) =
      _$LessonDetailsResultImpl.fromJson;

  @override
  String get id;
  @override
  String get paymentId;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  LessonStates get lessonState;
  @override
  double get price;
  @override
  bool get viewedByTutor;
  @override
  bool get userCanWriteReview;
  @override
  LessonPaymentMethod get studentPaymentMethod;
  @override
  SubjectListEntry get subject;
  @override
  ProfileCardData get lessonStudent;
  @override
  ProfileCardData get lessonTutor;
  @override
  List<LessonTag> get tags;

  /// Create a copy of LessonDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonDetailsResultImplCopyWith<_$LessonDetailsResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
