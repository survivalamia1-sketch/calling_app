// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connecting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            ConnectionStatus status, String message, double progress)
        connecting,
    required TResult Function(String roomId) connected,
    required TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)
        failed,
    required TResult Function() cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult? Function(String roomId)? connected,
    TResult? Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult? Function()? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult Function(String roomId)? connected,
    TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectingStateCopyWith<$Res> {
  factory $ConnectingStateCopyWith(
          ConnectingState value, $Res Function(ConnectingState) then) =
      _$ConnectingStateCopyWithImpl<$Res, ConnectingState>;
}

/// @nodoc
class _$ConnectingStateCopyWithImpl<$Res, $Val extends ConnectingState>
    implements $ConnectingStateCopyWith<$Res> {
  _$ConnectingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ConnectingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ConnectingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            ConnectionStatus status, String message, double progress)
        connecting,
    required TResult Function(String roomId) connected,
    required TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)
        failed,
    required TResult Function() cancelled,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult? Function(String roomId)? connected,
    TResult? Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult? Function()? cancelled,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult Function(String roomId)? connected,
    TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ConnectingState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConnectionStatus status, String message, double progress});
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$ConnectingStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? progress = null,
  }) {
    return _then(_$ConnectingImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ConnectingImpl implements Connecting {
  const _$ConnectingImpl(
      {required this.status, required this.message, this.progress = 0.0});

  @override
  final ConnectionStatus status;
  @override
  final String message;
  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'ConnectingState.connecting(status: $status, message: $message, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectingImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      __$$ConnectingImplCopyWithImpl<_$ConnectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            ConnectionStatus status, String message, double progress)
        connecting,
    required TResult Function(String roomId) connected,
    required TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)
        failed,
    required TResult Function() cancelled,
  }) {
    return connecting(status, message, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult? Function(String roomId)? connected,
    TResult? Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult? Function()? cancelled,
  }) {
    return connecting?.call(status, message, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult Function(String roomId)? connected,
    TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(status, message, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class Connecting implements ConnectingState {
  const factory Connecting(
      {required final ConnectionStatus status,
      required final String message,
      final double progress}) = _$ConnectingImpl;

  ConnectionStatus get status;
  String get message;
  double get progress;
  @JsonKey(ignore: true)
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$ConnectingStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$ConnectedImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  const _$ConnectedImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'ConnectingState.connected(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            ConnectionStatus status, String message, double progress)
        connecting,
    required TResult Function(String roomId) connected,
    required TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)
        failed,
    required TResult Function() cancelled,
  }) {
    return connected(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult? Function(String roomId)? connected,
    TResult? Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult? Function()? cancelled,
  }) {
    return connected?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult Function(String roomId)? connected,
    TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements ConnectingState {
  const factory Connected({required final String roomId}) = _$ConnectedImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, ConnectionErrorType errorType, bool canRetry});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$ConnectingStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errorType = null,
    Object? canRetry = null,
  }) {
    return _then(_$FailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorType: null == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as ConnectionErrorType,
      canRetry: null == canRetry
          ? _value.canRetry
          : canRetry // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements Failed {
  const _$FailedImpl(
      {required this.message, required this.errorType, this.canRetry = false});

  @override
  final String message;
  @override
  final ConnectionErrorType errorType;
  @override
  @JsonKey()
  final bool canRetry;

  @override
  String toString() {
    return 'ConnectingState.failed(message: $message, errorType: $errorType, canRetry: $canRetry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            (identical(other.canRetry, canRetry) ||
                other.canRetry == canRetry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorType, canRetry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            ConnectionStatus status, String message, double progress)
        connecting,
    required TResult Function(String roomId) connected,
    required TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)
        failed,
    required TResult Function() cancelled,
  }) {
    return failed(message, errorType, canRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult? Function(String roomId)? connected,
    TResult? Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult? Function()? cancelled,
  }) {
    return failed?.call(message, errorType, canRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult Function(String roomId)? connected,
    TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message, errorType, canRetry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed implements ConnectingState {
  const factory Failed(
      {required final String message,
      required final ConnectionErrorType errorType,
      final bool canRetry}) = _$FailedImpl;

  String get message;
  ConnectionErrorType get errorType;
  bool get canRetry;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledImplCopyWith<$Res> {
  factory _$$CancelledImplCopyWith(
          _$CancelledImpl value, $Res Function(_$CancelledImpl) then) =
      __$$CancelledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledImplCopyWithImpl<$Res>
    extends _$ConnectingStateCopyWithImpl<$Res, _$CancelledImpl>
    implements _$$CancelledImplCopyWith<$Res> {
  __$$CancelledImplCopyWithImpl(
      _$CancelledImpl _value, $Res Function(_$CancelledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelledImpl implements Cancelled {
  const _$CancelledImpl();

  @override
  String toString() {
    return 'ConnectingState.cancelled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            ConnectionStatus status, String message, double progress)
        connecting,
    required TResult Function(String roomId) connected,
    required TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)
        failed,
    required TResult Function() cancelled,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult? Function(String roomId)? connected,
    TResult? Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult? Function()? cancelled,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ConnectionStatus status, String message, double progress)?
        connecting,
    TResult Function(String roomId)? connected,
    TResult Function(
            String message, ConnectionErrorType errorType, bool canRetry)?
        failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class Cancelled implements ConnectingState {
  const factory Cancelled() = _$CancelledImpl;
}
