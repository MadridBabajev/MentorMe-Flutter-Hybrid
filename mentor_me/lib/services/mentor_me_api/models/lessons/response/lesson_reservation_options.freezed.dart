// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_reservation_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonReservationOptions _$LessonReservationOptionsFromJson(
    Map<String, dynamic> json) {
  return _LessonReservationOptions.fromJson(json);
}

/// @nodoc
mixin _$LessonReservationOptions {
  List<LessonPaymentMethod>? get paymentMethods =>
      throw _privateConstructorUsedError;
  List<NewAvailabilityPayload>? get availabilities =>
      throw _privateConstructorUsedError;
  List<SubjectNameEntry>? get subjects => throw _privateConstructorUsedError;

  /// Serializes this LessonReservationOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonReservationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonReservationOptionsCopyWith<LessonReservationOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonReservationOptionsCopyWith<$Res> {
  factory $LessonReservationOptionsCopyWith(LessonReservationOptions value,
          $Res Function(LessonReservationOptions) then) =
      _$LessonReservationOptionsCopyWithImpl<$Res, LessonReservationOptions>;
  @useResult
  $Res call(
      {List<LessonPaymentMethod>? paymentMethods,
      List<NewAvailabilityPayload>? availabilities,
      List<SubjectNameEntry>? subjects});
}

/// @nodoc
class _$LessonReservationOptionsCopyWithImpl<$Res,
        $Val extends LessonReservationOptions>
    implements $LessonReservationOptionsCopyWith<$Res> {
  _$LessonReservationOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonReservationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = freezed,
    Object? availabilities = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      paymentMethods: freezed == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<LessonPaymentMethod>?,
      availabilities: freezed == availabilities
          ? _value.availabilities
          : availabilities // ignore: cast_nullable_to_non_nullable
              as List<NewAvailabilityPayload>?,
      subjects: freezed == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectNameEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonReservationOptionsImplCopyWith<$Res>
    implements $LessonReservationOptionsCopyWith<$Res> {
  factory _$$LessonReservationOptionsImplCopyWith(
          _$LessonReservationOptionsImpl value,
          $Res Function(_$LessonReservationOptionsImpl) then) =
      __$$LessonReservationOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LessonPaymentMethod>? paymentMethods,
      List<NewAvailabilityPayload>? availabilities,
      List<SubjectNameEntry>? subjects});
}

/// @nodoc
class __$$LessonReservationOptionsImplCopyWithImpl<$Res>
    extends _$LessonReservationOptionsCopyWithImpl<$Res,
        _$LessonReservationOptionsImpl>
    implements _$$LessonReservationOptionsImplCopyWith<$Res> {
  __$$LessonReservationOptionsImplCopyWithImpl(
      _$LessonReservationOptionsImpl _value,
      $Res Function(_$LessonReservationOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonReservationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = freezed,
    Object? availabilities = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_$LessonReservationOptionsImpl(
      paymentMethods: freezed == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<LessonPaymentMethod>?,
      availabilities: freezed == availabilities
          ? _value._availabilities
          : availabilities // ignore: cast_nullable_to_non_nullable
              as List<NewAvailabilityPayload>?,
      subjects: freezed == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectNameEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonReservationOptionsImpl implements _LessonReservationOptions {
  const _$LessonReservationOptionsImpl(
      {required final List<LessonPaymentMethod>? paymentMethods,
      required final List<NewAvailabilityPayload>? availabilities,
      required final List<SubjectNameEntry>? subjects})
      : _paymentMethods = paymentMethods,
        _availabilities = availabilities,
        _subjects = subjects;

  factory _$LessonReservationOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonReservationOptionsImplFromJson(json);

  final List<LessonPaymentMethod>? _paymentMethods;
  @override
  List<LessonPaymentMethod>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<NewAvailabilityPayload>? _availabilities;
  @override
  List<NewAvailabilityPayload>? get availabilities {
    final value = _availabilities;
    if (value == null) return null;
    if (_availabilities is EqualUnmodifiableListView) return _availabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SubjectNameEntry>? _subjects;
  @override
  List<SubjectNameEntry>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LessonReservationOptions(paymentMethods: $paymentMethods, availabilities: $availabilities, subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonReservationOptionsImpl &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            const DeepCollectionEquality()
                .equals(other._availabilities, _availabilities) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paymentMethods),
      const DeepCollectionEquality().hash(_availabilities),
      const DeepCollectionEquality().hash(_subjects));

  /// Create a copy of LessonReservationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonReservationOptionsImplCopyWith<_$LessonReservationOptionsImpl>
      get copyWith => __$$LessonReservationOptionsImplCopyWithImpl<
          _$LessonReservationOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonReservationOptionsImplToJson(
      this,
    );
  }
}

abstract class _LessonReservationOptions implements LessonReservationOptions {
  const factory _LessonReservationOptions(
          {required final List<LessonPaymentMethod>? paymentMethods,
          required final List<NewAvailabilityPayload>? availabilities,
          required final List<SubjectNameEntry>? subjects}) =
      _$LessonReservationOptionsImpl;

  factory _LessonReservationOptions.fromJson(Map<String, dynamic> json) =
      _$LessonReservationOptionsImpl.fromJson;

  @override
  List<LessonPaymentMethod>? get paymentMethods;
  @override
  List<NewAvailabilityPayload>? get availabilities;
  @override
  List<SubjectNameEntry>? get subjects;

  /// Create a copy of LessonReservationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonReservationOptionsImplCopyWith<_$LessonReservationOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
