// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_details_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectDetailsResult _$SubjectDetailsResultFromJson(Map<String, dynamic> json) {
  return _SubjectDetailsResult.fromJson(json);
}

/// @nodoc
mixin _$SubjectDetailsResult {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "taughtBy")
  int get taughtByPeopleCount => throw _privateConstructorUsedError;
  @JsonKey(name: "learnedBy")
  int get learnedByPeopleCount => throw _privateConstructorUsedError;
  @Base64Uint8ListConverter()
  Uint8List? get subjectPicture => throw _privateConstructorUsedError;
  bool? get isAdded => throw _privateConstructorUsedError;

  /// Serializes this SubjectDetailsResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectDetailsResultCopyWith<SubjectDetailsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectDetailsResultCopyWith<$Res> {
  factory $SubjectDetailsResultCopyWith(SubjectDetailsResult value,
          $Res Function(SubjectDetailsResult) then) =
      _$SubjectDetailsResultCopyWithImpl<$Res, SubjectDetailsResult>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      @JsonKey(name: "taughtBy") int taughtByPeopleCount,
      @JsonKey(name: "learnedBy") int learnedByPeopleCount,
      @Base64Uint8ListConverter() Uint8List? subjectPicture,
      bool? isAdded});
}

/// @nodoc
class _$SubjectDetailsResultCopyWithImpl<$Res,
        $Val extends SubjectDetailsResult>
    implements $SubjectDetailsResultCopyWith<$Res> {
  _$SubjectDetailsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? taughtByPeopleCount = null,
    Object? learnedByPeopleCount = null,
    Object? subjectPicture = freezed,
    Object? isAdded = freezed,
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
      taughtByPeopleCount: null == taughtByPeopleCount
          ? _value.taughtByPeopleCount
          : taughtByPeopleCount // ignore: cast_nullable_to_non_nullable
              as int,
      learnedByPeopleCount: null == learnedByPeopleCount
          ? _value.learnedByPeopleCount
          : learnedByPeopleCount // ignore: cast_nullable_to_non_nullable
              as int,
      subjectPicture: freezed == subjectPicture
          ? _value.subjectPicture
          : subjectPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isAdded: freezed == isAdded
          ? _value.isAdded
          : isAdded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectDetailsResultImplCopyWith<$Res>
    implements $SubjectDetailsResultCopyWith<$Res> {
  factory _$$SubjectDetailsResultImplCopyWith(_$SubjectDetailsResultImpl value,
          $Res Function(_$SubjectDetailsResultImpl) then) =
      __$$SubjectDetailsResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      @JsonKey(name: "taughtBy") int taughtByPeopleCount,
      @JsonKey(name: "learnedBy") int learnedByPeopleCount,
      @Base64Uint8ListConverter() Uint8List? subjectPicture,
      bool? isAdded});
}

/// @nodoc
class __$$SubjectDetailsResultImplCopyWithImpl<$Res>
    extends _$SubjectDetailsResultCopyWithImpl<$Res, _$SubjectDetailsResultImpl>
    implements _$$SubjectDetailsResultImplCopyWith<$Res> {
  __$$SubjectDetailsResultImplCopyWithImpl(_$SubjectDetailsResultImpl _value,
      $Res Function(_$SubjectDetailsResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? taughtByPeopleCount = null,
    Object? learnedByPeopleCount = null,
    Object? subjectPicture = freezed,
    Object? isAdded = freezed,
  }) {
    return _then(_$SubjectDetailsResultImpl(
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
      taughtByPeopleCount: null == taughtByPeopleCount
          ? _value.taughtByPeopleCount
          : taughtByPeopleCount // ignore: cast_nullable_to_non_nullable
              as int,
      learnedByPeopleCount: null == learnedByPeopleCount
          ? _value.learnedByPeopleCount
          : learnedByPeopleCount // ignore: cast_nullable_to_non_nullable
              as int,
      subjectPicture: freezed == subjectPicture
          ? _value.subjectPicture
          : subjectPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isAdded: freezed == isAdded
          ? _value.isAdded
          : isAdded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectDetailsResultImpl implements _SubjectDetailsResult {
  const _$SubjectDetailsResultImpl(
      {required this.id,
      required this.name,
      required this.description,
      @JsonKey(name: "taughtBy") required this.taughtByPeopleCount,
      @JsonKey(name: "learnedBy") required this.learnedByPeopleCount,
      @Base64Uint8ListConverter() required this.subjectPicture,
      required this.isAdded});

  factory _$SubjectDetailsResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectDetailsResultImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: "taughtBy")
  final int taughtByPeopleCount;
  @override
  @JsonKey(name: "learnedBy")
  final int learnedByPeopleCount;
  @override
  @Base64Uint8ListConverter()
  final Uint8List? subjectPicture;
  @override
  final bool? isAdded;

  @override
  String toString() {
    return 'SubjectDetailsResult(id: $id, name: $name, description: $description, taughtByPeopleCount: $taughtByPeopleCount, learnedByPeopleCount: $learnedByPeopleCount, subjectPicture: $subjectPicture, isAdded: $isAdded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectDetailsResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.taughtByPeopleCount, taughtByPeopleCount) ||
                other.taughtByPeopleCount == taughtByPeopleCount) &&
            (identical(other.learnedByPeopleCount, learnedByPeopleCount) ||
                other.learnedByPeopleCount == learnedByPeopleCount) &&
            const DeepCollectionEquality()
                .equals(other.subjectPicture, subjectPicture) &&
            (identical(other.isAdded, isAdded) || other.isAdded == isAdded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      taughtByPeopleCount,
      learnedByPeopleCount,
      const DeepCollectionEquality().hash(subjectPicture),
      isAdded);

  /// Create a copy of SubjectDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectDetailsResultImplCopyWith<_$SubjectDetailsResultImpl>
      get copyWith =>
          __$$SubjectDetailsResultImplCopyWithImpl<_$SubjectDetailsResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectDetailsResultImplToJson(
      this,
    );
  }
}

abstract class _SubjectDetailsResult implements SubjectDetailsResult {
  const factory _SubjectDetailsResult(
      {required final String id,
      required final String name,
      required final String description,
      @JsonKey(name: "taughtBy") required final int taughtByPeopleCount,
      @JsonKey(name: "learnedBy") required final int learnedByPeopleCount,
      @Base64Uint8ListConverter() required final Uint8List? subjectPicture,
      required final bool? isAdded}) = _$SubjectDetailsResultImpl;

  factory _SubjectDetailsResult.fromJson(Map<String, dynamic> json) =
      _$SubjectDetailsResultImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: "taughtBy")
  int get taughtByPeopleCount;
  @override
  @JsonKey(name: "learnedBy")
  int get learnedByPeopleCount;
  @override
  @Base64Uint8ListConverter()
  Uint8List? get subjectPicture;
  @override
  bool? get isAdded;

  /// Create a copy of SubjectDetailsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectDetailsResultImplCopyWith<_$SubjectDetailsResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
