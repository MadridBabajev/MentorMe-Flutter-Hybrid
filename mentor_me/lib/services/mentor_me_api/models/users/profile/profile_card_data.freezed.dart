// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_card_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileCardData _$ProfileCardDataFromJson(Map<String, dynamic> json) {
  return _ProfileCardData.fromJson(json);
}

/// @nodoc
mixin _$ProfileCardData {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  @Base64Uint8ListConverter()
  Uint8List? get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this ProfileCardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileCardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCardDataCopyWith<ProfileCardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCardDataCopyWith<$Res> {
  factory $ProfileCardDataCopyWith(
          ProfileCardData value, $Res Function(ProfileCardData) then) =
      _$ProfileCardDataCopyWithImpl<$Res, ProfileCardData>;
  @useResult
  $Res call(
      {String id,
      String fullName,
      double averageRating,
      @Base64Uint8ListConverter() Uint8List? profilePicture});
}

/// @nodoc
class _$ProfileCardDataCopyWithImpl<$Res, $Val extends ProfileCardData>
    implements $ProfileCardDataCopyWith<$Res> {
  _$ProfileCardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileCardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? averageRating = null,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileCardDataImplCopyWith<$Res>
    implements $ProfileCardDataCopyWith<$Res> {
  factory _$$ProfileCardDataImplCopyWith(_$ProfileCardDataImpl value,
          $Res Function(_$ProfileCardDataImpl) then) =
      __$$ProfileCardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      double averageRating,
      @Base64Uint8ListConverter() Uint8List? profilePicture});
}

/// @nodoc
class __$$ProfileCardDataImplCopyWithImpl<$Res>
    extends _$ProfileCardDataCopyWithImpl<$Res, _$ProfileCardDataImpl>
    implements _$$ProfileCardDataImplCopyWith<$Res> {
  __$$ProfileCardDataImplCopyWithImpl(
      _$ProfileCardDataImpl _value, $Res Function(_$ProfileCardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileCardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? averageRating = null,
    Object? profilePicture = freezed,
  }) {
    return _then(_$ProfileCardDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileCardDataImpl implements _ProfileCardData {
  const _$ProfileCardDataImpl(
      {required this.id,
      required this.fullName,
      required this.averageRating,
      @Base64Uint8ListConverter() this.profilePicture});

  factory _$ProfileCardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileCardDataImplFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final double averageRating;
  @override
  @Base64Uint8ListConverter()
  final Uint8List? profilePicture;

  @override
  String toString() {
    return 'ProfileCardData(id: $id, fullName: $fullName, averageRating: $averageRating, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileCardDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, averageRating,
      const DeepCollectionEquality().hash(profilePicture));

  /// Create a copy of ProfileCardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileCardDataImplCopyWith<_$ProfileCardDataImpl> get copyWith =>
      __$$ProfileCardDataImplCopyWithImpl<_$ProfileCardDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileCardDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileCardData implements ProfileCardData {
  const factory _ProfileCardData(
          {required final String id,
          required final String fullName,
          required final double averageRating,
          @Base64Uint8ListConverter() final Uint8List? profilePicture}) =
      _$ProfileCardDataImpl;

  factory _ProfileCardData.fromJson(Map<String, dynamic> json) =
      _$ProfileCardDataImpl.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  double get averageRating;
  @override
  @Base64Uint8ListConverter()
  Uint8List? get profilePicture;

  /// Create a copy of ProfileCardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileCardDataImplCopyWith<_$ProfileCardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
