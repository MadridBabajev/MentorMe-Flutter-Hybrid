// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonTag _$LessonTagFromJson(Map<String, dynamic> json) {
  return _LessonTag.fromJson(json);
}

/// @nodoc
mixin _$LessonTag {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;

  /// Serializes this LessonTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonTagCopyWith<LessonTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonTagCopyWith<$Res> {
  factory $LessonTagCopyWith(LessonTag value, $Res Function(LessonTag) then) =
      _$LessonTagCopyWithImpl<$Res, LessonTag>;
  @useResult
  $Res call({String id, String name, String description, DateTime addedAt});
}

/// @nodoc
class _$LessonTagCopyWithImpl<$Res, $Val extends LessonTag>
    implements $LessonTagCopyWith<$Res> {
  _$LessonTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? addedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonTagImplCopyWith<$Res>
    implements $LessonTagCopyWith<$Res> {
  factory _$$LessonTagImplCopyWith(
          _$LessonTagImpl value, $Res Function(_$LessonTagImpl) then) =
      __$$LessonTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description, DateTime addedAt});
}

/// @nodoc
class __$$LessonTagImplCopyWithImpl<$Res>
    extends _$LessonTagCopyWithImpl<$Res, _$LessonTagImpl>
    implements _$$LessonTagImplCopyWith<$Res> {
  __$$LessonTagImplCopyWithImpl(
      _$LessonTagImpl _value, $Res Function(_$LessonTagImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? addedAt = null,
  }) {
    return _then(_$LessonTagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonTagImpl implements _LessonTag {
  const _$LessonTagImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.addedAt});

  factory _$LessonTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonTagImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime addedAt;

  @override
  String toString() {
    return 'LessonTag(id: $id, name: $name, description: $description, addedAt: $addedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, addedAt);

  /// Create a copy of LessonTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonTagImplCopyWith<_$LessonTagImpl> get copyWith =>
      __$$LessonTagImplCopyWithImpl<_$LessonTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonTagImplToJson(
      this,
    );
  }
}

abstract class _LessonTag implements LessonTag {
  const factory _LessonTag(
      {required final String id,
      required final String name,
      required final String description,
      required final DateTime addedAt}) = _$LessonTagImpl;

  factory _LessonTag.fromJson(Map<String, dynamic> json) =
      _$LessonTagImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get addedAt;

  /// Create a copy of LessonTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonTagImplCopyWith<_$LessonTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
