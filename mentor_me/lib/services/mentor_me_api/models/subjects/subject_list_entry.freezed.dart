// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_list_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectListEntry _$SubjectListEntryFromJson(Map<String, dynamic> json) {
  return _SubjectListEntry.fromJson(json);
}

/// @nodoc
mixin _$SubjectListEntry {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @Base64Uint8ListConverter()
  Uint8List? get subjectPicture => throw _privateConstructorUsedError;

  /// Serializes this SubjectListEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectListEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectListEntryCopyWith<SubjectListEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectListEntryCopyWith<$Res> {
  factory $SubjectListEntryCopyWith(
          SubjectListEntry value, $Res Function(SubjectListEntry) then) =
      _$SubjectListEntryCopyWithImpl<$Res, SubjectListEntry>;
  @useResult
  $Res call(
      {String id,
      String name,
      @Base64Uint8ListConverter() Uint8List? subjectPicture});
}

/// @nodoc
class _$SubjectListEntryCopyWithImpl<$Res, $Val extends SubjectListEntry>
    implements $SubjectListEntryCopyWith<$Res> {
  _$SubjectListEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectListEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? subjectPicture = freezed,
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
      subjectPicture: freezed == subjectPicture
          ? _value.subjectPicture
          : subjectPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectListEntryImplCopyWith<$Res>
    implements $SubjectListEntryCopyWith<$Res> {
  factory _$$SubjectListEntryImplCopyWith(_$SubjectListEntryImpl value,
          $Res Function(_$SubjectListEntryImpl) then) =
      __$$SubjectListEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @Base64Uint8ListConverter() Uint8List? subjectPicture});
}

/// @nodoc
class __$$SubjectListEntryImplCopyWithImpl<$Res>
    extends _$SubjectListEntryCopyWithImpl<$Res, _$SubjectListEntryImpl>
    implements _$$SubjectListEntryImplCopyWith<$Res> {
  __$$SubjectListEntryImplCopyWithImpl(_$SubjectListEntryImpl _value,
      $Res Function(_$SubjectListEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectListEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? subjectPicture = freezed,
  }) {
    return _then(_$SubjectListEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subjectPicture: freezed == subjectPicture
          ? _value.subjectPicture
          : subjectPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectListEntryImpl implements _SubjectListEntry {
  const _$SubjectListEntryImpl(
      {required this.id,
      required this.name,
      @Base64Uint8ListConverter() this.subjectPicture});

  factory _$SubjectListEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectListEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @Base64Uint8ListConverter()
  final Uint8List? subjectPicture;

  @override
  String toString() {
    return 'SubjectListEntry(id: $id, name: $name, subjectPicture: $subjectPicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectListEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.subjectPicture, subjectPicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(subjectPicture));

  /// Create a copy of SubjectListEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectListEntryImplCopyWith<_$SubjectListEntryImpl> get copyWith =>
      __$$SubjectListEntryImplCopyWithImpl<_$SubjectListEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectListEntryImplToJson(
      this,
    );
  }
}

abstract class _SubjectListEntry implements SubjectListEntry {
  const factory _SubjectListEntry(
          {required final String id,
          required final String name,
          @Base64Uint8ListConverter() final Uint8List? subjectPicture}) =
      _$SubjectListEntryImpl;

  factory _SubjectListEntry.fromJson(Map<String, dynamic> json) =
      _$SubjectListEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @Base64Uint8ListConverter()
  Uint8List? get subjectPicture;

  /// Create a copy of SubjectListEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectListEntryImplCopyWith<_$SubjectListEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
