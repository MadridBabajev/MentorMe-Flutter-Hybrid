// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_profile_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TutorProfileResult _$TutorProfileResultFromJson(Map<String, dynamic> json) {
  return _TutorProfileResult.fromJson(json);
}

/// @nodoc
mixin _$TutorProfileResult {
  String get id => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get mobilePhone => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  @Base64Uint8ListConverter()
  Uint8List? get profilePicture => throw _privateConstructorUsedError;
  List<SubjectListEntry>? get subjects => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  int get numberOfClasses => throw _privateConstructorUsedError;
  double get hourlyRate => throw _privateConstructorUsedError;
  List<AvailabilityEntry>? get availabilities =>
      throw _privateConstructorUsedError;

  /// Serializes this TutorProfileResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TutorProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TutorProfileResultCopyWith<TutorProfileResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorProfileResultCopyWith<$Res> {
  factory $TutorProfileResultCopyWith(
          TutorProfileResult value, $Res Function(TutorProfileResult) then) =
      _$TutorProfileResultCopyWithImpl<$Res, TutorProfileResult>;
  @useResult
  $Res call(
      {String id,
      bool notificationsEnabled,
      String firstName,
      String lastName,
      String mobilePhone,
      double balance,
      double averageRating,
      String title,
      String bio,
      @Base64Uint8ListConverter() Uint8List? profilePicture,
      List<SubjectListEntry>? subjects,
      bool isPublic,
      int numberOfClasses,
      double hourlyRate,
      List<AvailabilityEntry>? availabilities});
}

/// @nodoc
class _$TutorProfileResultCopyWithImpl<$Res, $Val extends TutorProfileResult>
    implements $TutorProfileResultCopyWith<$Res> {
  _$TutorProfileResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TutorProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notificationsEnabled = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobilePhone = null,
    Object? balance = null,
    Object? averageRating = null,
    Object? title = null,
    Object? bio = null,
    Object? profilePicture = freezed,
    Object? subjects = freezed,
    Object? isPublic = null,
    Object? numberOfClasses = null,
    Object? hourlyRate = null,
    Object? availabilities = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      subjects: freezed == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectListEntry>?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfClasses: null == numberOfClasses
          ? _value.numberOfClasses
          : numberOfClasses // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      availabilities: freezed == availabilities
          ? _value.availabilities
          : availabilities // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorProfileResultImplCopyWith<$Res>
    implements $TutorProfileResultCopyWith<$Res> {
  factory _$$TutorProfileResultImplCopyWith(_$TutorProfileResultImpl value,
          $Res Function(_$TutorProfileResultImpl) then) =
      __$$TutorProfileResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool notificationsEnabled,
      String firstName,
      String lastName,
      String mobilePhone,
      double balance,
      double averageRating,
      String title,
      String bio,
      @Base64Uint8ListConverter() Uint8List? profilePicture,
      List<SubjectListEntry>? subjects,
      bool isPublic,
      int numberOfClasses,
      double hourlyRate,
      List<AvailabilityEntry>? availabilities});
}

/// @nodoc
class __$$TutorProfileResultImplCopyWithImpl<$Res>
    extends _$TutorProfileResultCopyWithImpl<$Res, _$TutorProfileResultImpl>
    implements _$$TutorProfileResultImplCopyWith<$Res> {
  __$$TutorProfileResultImplCopyWithImpl(_$TutorProfileResultImpl _value,
      $Res Function(_$TutorProfileResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TutorProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notificationsEnabled = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobilePhone = null,
    Object? balance = null,
    Object? averageRating = null,
    Object? title = null,
    Object? bio = null,
    Object? profilePicture = freezed,
    Object? subjects = freezed,
    Object? isPublic = null,
    Object? numberOfClasses = null,
    Object? hourlyRate = null,
    Object? availabilities = freezed,
  }) {
    return _then(_$TutorProfileResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      subjects: freezed == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectListEntry>?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfClasses: null == numberOfClasses
          ? _value.numberOfClasses
          : numberOfClasses // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      availabilities: freezed == availabilities
          ? _value._availabilities
          : availabilities // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TutorProfileResultImpl implements _TutorProfileResult {
  const _$TutorProfileResultImpl(
      {required this.id,
      required this.notificationsEnabled,
      required this.firstName,
      required this.lastName,
      required this.mobilePhone,
      required this.balance,
      required this.averageRating,
      required this.title,
      required this.bio,
      @Base64Uint8ListConverter() this.profilePicture,
      final List<SubjectListEntry>? subjects,
      required this.isPublic,
      required this.numberOfClasses,
      required this.hourlyRate,
      final List<AvailabilityEntry>? availabilities})
      : _subjects = subjects,
        _availabilities = availabilities;

  factory _$TutorProfileResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorProfileResultImplFromJson(json);

  @override
  final String id;
  @override
  final bool notificationsEnabled;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String mobilePhone;
  @override
  final double balance;
  @override
  final double averageRating;
  @override
  final String title;
  @override
  final String bio;
  @override
  @Base64Uint8ListConverter()
  final Uint8List? profilePicture;
  final List<SubjectListEntry>? _subjects;
  @override
  List<SubjectListEntry>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isPublic;
  @override
  final int numberOfClasses;
  @override
  final double hourlyRate;
  final List<AvailabilityEntry>? _availabilities;
  @override
  List<AvailabilityEntry>? get availabilities {
    final value = _availabilities;
    if (value == null) return null;
    if (_availabilities is EqualUnmodifiableListView) return _availabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TutorProfileResult(id: $id, notificationsEnabled: $notificationsEnabled, firstName: $firstName, lastName: $lastName, mobilePhone: $mobilePhone, balance: $balance, averageRating: $averageRating, title: $title, bio: $bio, profilePicture: $profilePicture, subjects: $subjects, isPublic: $isPublic, numberOfClasses: $numberOfClasses, hourlyRate: $hourlyRate, availabilities: $availabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorProfileResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobilePhone, mobilePhone) ||
                other.mobilePhone == mobilePhone) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.numberOfClasses, numberOfClasses) ||
                other.numberOfClasses == numberOfClasses) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            const DeepCollectionEquality()
                .equals(other._availabilities, _availabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      notificationsEnabled,
      firstName,
      lastName,
      mobilePhone,
      balance,
      averageRating,
      title,
      bio,
      const DeepCollectionEquality().hash(profilePicture),
      const DeepCollectionEquality().hash(_subjects),
      isPublic,
      numberOfClasses,
      hourlyRate,
      const DeepCollectionEquality().hash(_availabilities));

  /// Create a copy of TutorProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorProfileResultImplCopyWith<_$TutorProfileResultImpl> get copyWith =>
      __$$TutorProfileResultImplCopyWithImpl<_$TutorProfileResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorProfileResultImplToJson(
      this,
    );
  }
}

abstract class _TutorProfileResult implements TutorProfileResult {
  const factory _TutorProfileResult(
          {required final String id,
          required final bool notificationsEnabled,
          required final String firstName,
          required final String lastName,
          required final String mobilePhone,
          required final double balance,
          required final double averageRating,
          required final String title,
          required final String bio,
          @Base64Uint8ListConverter() final Uint8List? profilePicture,
          final List<SubjectListEntry>? subjects,
          required final bool isPublic,
          required final int numberOfClasses,
          required final double hourlyRate,
          final List<AvailabilityEntry>? availabilities}) =
      _$TutorProfileResultImpl;

  factory _TutorProfileResult.fromJson(Map<String, dynamic> json) =
      _$TutorProfileResultImpl.fromJson;

  @override
  String get id;
  @override
  bool get notificationsEnabled;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get mobilePhone;
  @override
  double get balance;
  @override
  double get averageRating;
  @override
  String get title;
  @override
  String get bio;
  @override
  @Base64Uint8ListConverter()
  Uint8List? get profilePicture;
  @override
  List<SubjectListEntry>? get subjects;
  @override
  bool get isPublic;
  @override
  int get numberOfClasses;
  @override
  double get hourlyRate;
  @override
  List<AvailabilityEntry>? get availabilities;

  /// Create a copy of TutorProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TutorProfileResultImplCopyWith<_$TutorProfileResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
