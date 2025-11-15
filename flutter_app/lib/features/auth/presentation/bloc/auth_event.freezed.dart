// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(_$CheckAuthStatusImpl value,
          $Res Function(_$CheckAuthStatusImpl) then) =
      __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
      _$CheckAuthStatusImpl _value, $Res Function(_$CheckAuthStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthStatusImpl implements CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class CheckAuthStatus implements AuthEvent {
  const factory CheckAuthStatus() = _$CheckAuthStatusImpl;
}

/// @nodoc
abstract class _$$SignInRequestedImplCopyWith<$Res> {
  factory _$$SignInRequestedImplCopyWith(_$SignInRequestedImpl value,
          $Res Function(_$SignInRequestedImpl) then) =
      __$$SignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInRequestedImpl>
    implements _$$SignInRequestedImplCopyWith<$Res> {
  __$$SignInRequestedImplCopyWithImpl(
      _$SignInRequestedImpl _value, $Res Function(_$SignInRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInRequestedImpl implements SignInRequested {
  const _$SignInRequestedImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      __$$SignInRequestedImplCopyWithImpl<_$SignInRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class SignInRequested implements AuthEvent {
  const factory SignInRequested(
      {required final String email,
      required final String password}) = _$SignInRequestedImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterRequestedImplCopyWith<$Res> {
  factory _$$RegisterRequestedImplCopyWith(_$RegisterRequestedImpl value,
          $Res Function(_$RegisterRequestedImpl) then) =
      __$$RegisterRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String firstName, String lastName});
}

/// @nodoc
class __$$RegisterRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterRequestedImpl>
    implements _$$RegisterRequestedImplCopyWith<$Res> {
  __$$RegisterRequestedImplCopyWithImpl(_$RegisterRequestedImpl _value,
      $Res Function(_$RegisterRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$RegisterRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterRequestedImpl implements RegisterRequested {
  const _$RegisterRequestedImpl(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'AuthEvent.registerRequested(email: $email, password: $password, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestedImplCopyWith<_$RegisterRequestedImpl> get copyWith =>
      __$$RegisterRequestedImplCopyWithImpl<_$RegisterRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return registerRequested(email, password, firstName, lastName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return registerRequested?.call(email, password, firstName, lastName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (registerRequested != null) {
      return registerRequested(email, password, firstName, lastName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return registerRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return registerRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (registerRequested != null) {
      return registerRequested(this);
    }
    return orElse();
  }
}

abstract class RegisterRequested implements AuthEvent {
  const factory RegisterRequested(
      {required final String email,
      required final String password,
      required final String firstName,
      required final String lastName}) = _$RegisterRequestedImpl;

  String get email;
  String get password;
  String get firstName;
  String get lastName;
  @JsonKey(ignore: true)
  _$$RegisterRequestedImplCopyWith<_$RegisterRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutRequestedImplCopyWith<$Res> {
  factory _$$SignOutRequestedImplCopyWith(_$SignOutRequestedImpl value,
          $Res Function(_$SignOutRequestedImpl) then) =
      __$$SignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutRequestedImpl>
    implements _$$SignOutRequestedImplCopyWith<$Res> {
  __$$SignOutRequestedImplCopyWithImpl(_$SignOutRequestedImpl _value,
      $Res Function(_$SignOutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignOutRequestedImpl implements SignOutRequested {
  const _$SignOutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class SignOutRequested implements AuthEvent {
  const factory SignOutRequested() = _$SignOutRequestedImpl;
}

/// @nodoc
abstract class _$$ForgotPasswordRequestedImplCopyWith<$Res> {
  factory _$$ForgotPasswordRequestedImplCopyWith(
          _$ForgotPasswordRequestedImpl value,
          $Res Function(_$ForgotPasswordRequestedImpl) then) =
      __$$ForgotPasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordRequestedImpl>
    implements _$$ForgotPasswordRequestedImplCopyWith<$Res> {
  __$$ForgotPasswordRequestedImplCopyWithImpl(
      _$ForgotPasswordRequestedImpl _value,
      $Res Function(_$ForgotPasswordRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordRequestedImpl implements ForgotPasswordRequested {
  const _$ForgotPasswordRequestedImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.forgotPasswordRequested(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordRequestedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordRequestedImplCopyWith<_$ForgotPasswordRequestedImpl>
      get copyWith => __$$ForgotPasswordRequestedImplCopyWithImpl<
          _$ForgotPasswordRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return forgotPasswordRequested(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return forgotPasswordRequested?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (forgotPasswordRequested != null) {
      return forgotPasswordRequested(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return forgotPasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return forgotPasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (forgotPasswordRequested != null) {
      return forgotPasswordRequested(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordRequested implements AuthEvent {
  const factory ForgotPasswordRequested({required final String email}) =
      _$ForgotPasswordRequestedImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$ForgotPasswordRequestedImplCopyWith<_$ForgotPasswordRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendVerificationRequestedImplCopyWith<$Res> {
  factory _$$ResendVerificationRequestedImplCopyWith(
          _$ResendVerificationRequestedImpl value,
          $Res Function(_$ResendVerificationRequestedImpl) then) =
      __$$ResendVerificationRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendVerificationRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResendVerificationRequestedImpl>
    implements _$$ResendVerificationRequestedImplCopyWith<$Res> {
  __$$ResendVerificationRequestedImplCopyWithImpl(
      _$ResendVerificationRequestedImpl _value,
      $Res Function(_$ResendVerificationRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendVerificationRequestedImpl implements ResendVerificationRequested {
  const _$ResendVerificationRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.resendVerificationRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendVerificationRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return resendVerificationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return resendVerificationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (resendVerificationRequested != null) {
      return resendVerificationRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return resendVerificationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return resendVerificationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (resendVerificationRequested != null) {
      return resendVerificationRequested(this);
    }
    return orElse();
  }
}

abstract class ResendVerificationRequested implements AuthEvent {
  const factory ResendVerificationRequested() =
      _$ResendVerificationRequestedImpl;
}

/// @nodoc
abstract class _$$GetCurrentUserRequestedImplCopyWith<$Res> {
  factory _$$GetCurrentUserRequestedImplCopyWith(
          _$GetCurrentUserRequestedImpl value,
          $Res Function(_$GetCurrentUserRequestedImpl) then) =
      __$$GetCurrentUserRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCurrentUserRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetCurrentUserRequestedImpl>
    implements _$$GetCurrentUserRequestedImplCopyWith<$Res> {
  __$$GetCurrentUserRequestedImplCopyWithImpl(
      _$GetCurrentUserRequestedImpl _value,
      $Res Function(_$GetCurrentUserRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCurrentUserRequestedImpl implements GetCurrentUserRequested {
  const _$GetCurrentUserRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.getCurrentUserRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCurrentUserRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
            String email, String password, String firstName, String lastName)
        registerRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) forgotPasswordRequested,
    required TResult Function() resendVerificationRequested,
    required TResult Function() getCurrentUserRequested,
  }) {
    return getCurrentUserRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? forgotPasswordRequested,
    TResult? Function()? resendVerificationRequested,
    TResult? Function()? getCurrentUserRequested,
  }) {
    return getCurrentUserRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(
            String email, String password, String firstName, String lastName)?
        registerRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? forgotPasswordRequested,
    TResult Function()? resendVerificationRequested,
    TResult Function()? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (getCurrentUserRequested != null) {
      return getCurrentUserRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(ResendVerificationRequested value)
        resendVerificationRequested,
    required TResult Function(GetCurrentUserRequested value)
        getCurrentUserRequested,
  }) {
    return getCurrentUserRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult? Function(GetCurrentUserRequested value)? getCurrentUserRequested,
  }) {
    return getCurrentUserRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(ResendVerificationRequested value)?
        resendVerificationRequested,
    TResult Function(GetCurrentUserRequested value)? getCurrentUserRequested,
    required TResult orElse(),
  }) {
    if (getCurrentUserRequested != null) {
      return getCurrentUserRequested(this);
    }
    return orElse();
  }
}

abstract class GetCurrentUserRequested implements AuthEvent {
  const factory GetCurrentUserRequested() = _$GetCurrentUserRequestedImpl;
}
