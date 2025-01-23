// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_name_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectNameEntry _$SubjectNameEntryFromJson(Map<String, dynamic> json) {
  return _SubjectNameEntry.fromJson(json);
}

/// @nodoc
mixin _$SubjectNameEntry {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this SubjectNameEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectNameEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectNameEntryCopyWith<SubjectNameEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectNameEntryCopyWith<$Res> {
  factory $SubjectNameEntryCopyWith(
          SubjectNameEntry value, $Res Function(SubjectNameEntry) then) =
      _$SubjectNameEntryCopyWithImpl<$Res, SubjectNameEntry>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$SubjectNameEntryCopyWithImpl<$Res, $Val extends SubjectNameEntry>
    implements $SubjectNameEntryCopyWith<$Res> {
  _$SubjectNameEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectNameEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectNameEntryImplCopyWith<$Res>
    implements $SubjectNameEntryCopyWith<$Res> {
  factory _$$SubjectNameEntryImplCopyWith(_$SubjectNameEntryImpl value,
          $Res Function(_$SubjectNameEntryImpl) then) =
      __$$SubjectNameEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$SubjectNameEntryImplCopyWithImpl<$Res>
    extends _$SubjectNameEntryCopyWithImpl<$Res, _$SubjectNameEntryImpl>
    implements _$$SubjectNameEntryImplCopyWith<$Res> {
  __$$SubjectNameEntryImplCopyWithImpl(_$SubjectNameEntryImpl _value,
      $Res Function(_$SubjectNameEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectNameEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SubjectNameEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectNameEntryImpl implements _SubjectNameEntry {
  const _$SubjectNameEntryImpl({required this.id, required this.name});

  factory _$SubjectNameEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectNameEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'SubjectNameEntry(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectNameEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of SubjectNameEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectNameEntryImplCopyWith<_$SubjectNameEntryImpl> get copyWith =>
      __$$SubjectNameEntryImplCopyWithImpl<_$SubjectNameEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectNameEntryImplToJson(
      this,
    );
  }
}

abstract class _SubjectNameEntry implements SubjectNameEntry {
  const factory _SubjectNameEntry(
      {required final String id,
      required final String name}) = _$SubjectNameEntryImpl;

  factory _SubjectNameEntry.fromJson(Map<String, dynamic> json) =
      _$SubjectNameEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of SubjectNameEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectNameEntryImplCopyWith<_$SubjectNameEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
