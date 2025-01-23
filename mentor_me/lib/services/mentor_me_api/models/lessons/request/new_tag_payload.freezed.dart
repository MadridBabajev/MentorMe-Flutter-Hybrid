// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_tag_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewTagPayload _$NewTagPayloadFromJson(Map<String, dynamic> json) {
  return _NewTagPayload.fromJson(json);
}

/// @nodoc
mixin _$NewTagPayload {
  String get lessonId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this NewTagPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewTagPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewTagPayloadCopyWith<NewTagPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTagPayloadCopyWith<$Res> {
  factory $NewTagPayloadCopyWith(
          NewTagPayload value, $Res Function(NewTagPayload) then) =
      _$NewTagPayloadCopyWithImpl<$Res, NewTagPayload>;
  @useResult
  $Res call({String lessonId, String name, String description});
}

/// @nodoc
class _$NewTagPayloadCopyWithImpl<$Res, $Val extends NewTagPayload>
    implements $NewTagPayloadCopyWith<$Res> {
  _$NewTagPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewTagPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewTagPayloadImplCopyWith<$Res>
    implements $NewTagPayloadCopyWith<$Res> {
  factory _$$NewTagPayloadImplCopyWith(
          _$NewTagPayloadImpl value, $Res Function(_$NewTagPayloadImpl) then) =
      __$$NewTagPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lessonId, String name, String description});
}

/// @nodoc
class __$$NewTagPayloadImplCopyWithImpl<$Res>
    extends _$NewTagPayloadCopyWithImpl<$Res, _$NewTagPayloadImpl>
    implements _$$NewTagPayloadImplCopyWith<$Res> {
  __$$NewTagPayloadImplCopyWithImpl(
      _$NewTagPayloadImpl _value, $Res Function(_$NewTagPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewTagPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$NewTagPayloadImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewTagPayloadImpl implements _NewTagPayload {
  const _$NewTagPayloadImpl(
      {required this.lessonId, required this.name, required this.description});

  factory _$NewTagPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewTagPayloadImplFromJson(json);

  @override
  final String lessonId;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'NewTagPayload(lessonId: $lessonId, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTagPayloadImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lessonId, name, description);

  /// Create a copy of NewTagPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewTagPayloadImplCopyWith<_$NewTagPayloadImpl> get copyWith =>
      __$$NewTagPayloadImplCopyWithImpl<_$NewTagPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewTagPayloadImplToJson(
      this,
    );
  }
}

abstract class _NewTagPayload implements NewTagPayload {
  const factory _NewTagPayload(
      {required final String lessonId,
      required final String name,
      required final String description}) = _$NewTagPayloadImpl;

  factory _NewTagPayload.fromJson(Map<String, dynamic> json) =
      _$NewTagPayloadImpl.fromJson;

  @override
  String get lessonId;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of NewTagPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewTagPayloadImplCopyWith<_$NewTagPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
