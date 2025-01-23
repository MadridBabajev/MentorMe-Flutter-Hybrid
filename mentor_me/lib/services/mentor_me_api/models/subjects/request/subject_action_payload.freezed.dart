// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_action_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectActionPayload _$SubjectActionPayloadFromJson(Map<String, dynamic> json) {
  return _SubjectActionPayload.fromJson(json);
}

/// @nodoc
mixin _$SubjectActionPayload {
  String get subjectId => throw _privateConstructorUsedError;
  SubjectActions get subjectAction => throw _privateConstructorUsedError;

  /// Serializes this SubjectActionPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectActionPayloadCopyWith<SubjectActionPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectActionPayloadCopyWith<$Res> {
  factory $SubjectActionPayloadCopyWith(SubjectActionPayload value,
          $Res Function(SubjectActionPayload) then) =
      _$SubjectActionPayloadCopyWithImpl<$Res, SubjectActionPayload>;
  @useResult
  $Res call({String subjectId, SubjectActions subjectAction});
}

/// @nodoc
class _$SubjectActionPayloadCopyWithImpl<$Res,
        $Val extends SubjectActionPayload>
    implements $SubjectActionPayloadCopyWith<$Res> {
  _$SubjectActionPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? subjectAction = null,
  }) {
    return _then(_value.copyWith(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      subjectAction: null == subjectAction
          ? _value.subjectAction
          : subjectAction // ignore: cast_nullable_to_non_nullable
              as SubjectActions,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectActionPayloadImplCopyWith<$Res>
    implements $SubjectActionPayloadCopyWith<$Res> {
  factory _$$SubjectActionPayloadImplCopyWith(_$SubjectActionPayloadImpl value,
          $Res Function(_$SubjectActionPayloadImpl) then) =
      __$$SubjectActionPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subjectId, SubjectActions subjectAction});
}

/// @nodoc
class __$$SubjectActionPayloadImplCopyWithImpl<$Res>
    extends _$SubjectActionPayloadCopyWithImpl<$Res, _$SubjectActionPayloadImpl>
    implements _$$SubjectActionPayloadImplCopyWith<$Res> {
  __$$SubjectActionPayloadImplCopyWithImpl(_$SubjectActionPayloadImpl _value,
      $Res Function(_$SubjectActionPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? subjectAction = null,
  }) {
    return _then(_$SubjectActionPayloadImpl(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      subjectAction: null == subjectAction
          ? _value.subjectAction
          : subjectAction // ignore: cast_nullable_to_non_nullable
              as SubjectActions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectActionPayloadImpl implements _SubjectActionPayload {
  const _$SubjectActionPayloadImpl(
      {required this.subjectId, required this.subjectAction});

  factory _$SubjectActionPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectActionPayloadImplFromJson(json);

  @override
  final String subjectId;
  @override
  final SubjectActions subjectAction;

  @override
  String toString() {
    return 'SubjectActionPayload(subjectId: $subjectId, subjectAction: $subjectAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectActionPayloadImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.subjectAction, subjectAction) ||
                other.subjectAction == subjectAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectId, subjectAction);

  /// Create a copy of SubjectActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectActionPayloadImplCopyWith<_$SubjectActionPayloadImpl>
      get copyWith =>
          __$$SubjectActionPayloadImplCopyWithImpl<_$SubjectActionPayloadImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectActionPayloadImplToJson(
      this,
    );
  }
}

abstract class _SubjectActionPayload implements SubjectActionPayload {
  const factory _SubjectActionPayload(
          {required final String subjectId,
          required final SubjectActions subjectAction}) =
      _$SubjectActionPayloadImpl;

  factory _SubjectActionPayload.fromJson(Map<String, dynamic> json) =
      _$SubjectActionPayloadImpl.fromJson;

  @override
  String get subjectId;
  @override
  SubjectActions get subjectAction;

  /// Create a copy of SubjectActionPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectActionPayloadImplCopyWith<_$SubjectActionPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
