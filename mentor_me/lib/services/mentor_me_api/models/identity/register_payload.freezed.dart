// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterPayload _$RegisterPayloadFromJson(Map<String, dynamic> json) {
  return _RegisterPayload.fromJson(json);
}

/// @nodoc
mixin _$RegisterPayload {
  String get email => throw _privateConstructorUsedError;
  String get mobilePhone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  bool get isTutor => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  /// Serializes this RegisterPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterPayloadCopyWith<RegisterPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPayloadCopyWith<$Res> {
  factory $RegisterPayloadCopyWith(
          RegisterPayload value, $Res Function(RegisterPayload) then) =
      _$RegisterPayloadCopyWithImpl<$Res, RegisterPayload>;
  @useResult
  $Res call(
      {String email,
      String mobilePhone,
      String password,
      String confirmPassword,
      String firstname,
      String lastname,
      bool isTutor,
      String country});
}

/// @nodoc
class _$RegisterPayloadCopyWithImpl<$Res, $Val extends RegisterPayload>
    implements $RegisterPayloadCopyWith<$Res> {
  _$RegisterPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? mobilePhone = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? isTutor = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      isTutor: null == isTutor
          ? _value.isTutor
          : isTutor // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPayloadImplCopyWith<$Res>
    implements $RegisterPayloadCopyWith<$Res> {
  factory _$$RegisterPayloadImplCopyWith(_$RegisterPayloadImpl value,
          $Res Function(_$RegisterPayloadImpl) then) =
      __$$RegisterPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String mobilePhone,
      String password,
      String confirmPassword,
      String firstname,
      String lastname,
      bool isTutor,
      String country});
}

/// @nodoc
class __$$RegisterPayloadImplCopyWithImpl<$Res>
    extends _$RegisterPayloadCopyWithImpl<$Res, _$RegisterPayloadImpl>
    implements _$$RegisterPayloadImplCopyWith<$Res> {
  __$$RegisterPayloadImplCopyWithImpl(
      _$RegisterPayloadImpl _value, $Res Function(_$RegisterPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? mobilePhone = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? isTutor = null,
    Object? country = null,
  }) {
    return _then(_$RegisterPayloadImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      isTutor: null == isTutor
          ? _value.isTutor
          : isTutor // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPayloadImpl implements _RegisterPayload {
  const _$RegisterPayloadImpl(
      {required this.email,
      required this.mobilePhone,
      required this.password,
      required this.confirmPassword,
      required this.firstname,
      required this.lastname,
      required this.isTutor,
      required this.country});

  factory _$RegisterPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterPayloadImplFromJson(json);

  @override
  final String email;
  @override
  final String mobilePhone;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final bool isTutor;
  @override
  final String country;

  @override
  String toString() {
    return 'RegisterPayload(email: $email, mobilePhone: $mobilePhone, password: $password, confirmPassword: $confirmPassword, firstname: $firstname, lastname: $lastname, isTutor: $isTutor, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPayloadImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobilePhone, mobilePhone) ||
                other.mobilePhone == mobilePhone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.isTutor, isTutor) || other.isTutor == isTutor) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, mobilePhone, password,
      confirmPassword, firstname, lastname, isTutor, country);

  /// Create a copy of RegisterPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPayloadImplCopyWith<_$RegisterPayloadImpl> get copyWith =>
      __$$RegisterPayloadImplCopyWithImpl<_$RegisterPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPayloadImplToJson(
      this,
    );
  }
}

abstract class _RegisterPayload implements RegisterPayload {
  const factory _RegisterPayload(
      {required final String email,
      required final String mobilePhone,
      required final String password,
      required final String confirmPassword,
      required final String firstname,
      required final String lastname,
      required final bool isTutor,
      required final String country}) = _$RegisterPayloadImpl;

  factory _RegisterPayload.fromJson(Map<String, dynamic> json) =
      _$RegisterPayloadImpl.fromJson;

  @override
  String get email;
  @override
  String get mobilePhone;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  bool get isTutor;
  @override
  String get country;

  /// Create a copy of RegisterPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterPayloadImplCopyWith<_$RegisterPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
