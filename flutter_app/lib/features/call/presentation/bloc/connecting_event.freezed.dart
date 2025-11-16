// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connecting_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, ConnectionOptions options)
        startConnecting,
    required TResult Function() cancelConnection,
    required TResult Function() retryConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, ConnectionOptions options)?
        startConnecting,
    TResult? Function()? cancelConnection,
    TResult? Function()? retryConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, ConnectionOptions options)? startConnecting,
    TResult Function()? cancelConnection,
    TResult Function()? retryConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartConnecting value) startConnecting,
    required TResult Function(CancelConnection value) cancelConnection,
    required TResult Function(RetryConnection value) retryConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartConnecting value)? startConnecting,
    TResult? Function(CancelConnection value)? cancelConnection,
    TResult? Function(RetryConnection value)? retryConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartConnecting value)? startConnecting,
    TResult Function(CancelConnection value)? cancelConnection,
    TResult Function(RetryConnection value)? retryConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectingEventCopyWith<$Res> {
  factory $ConnectingEventCopyWith(
          ConnectingEvent value, $Res Function(ConnectingEvent) then) =
      _$ConnectingEventCopyWithImpl<$Res, ConnectingEvent>;
}

/// @nodoc
class _$ConnectingEventCopyWithImpl<$Res, $Val extends ConnectingEvent>
    implements $ConnectingEventCopyWith<$Res> {
  _$ConnectingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartConnectingImplCopyWith<$Res> {
  factory _$$StartConnectingImplCopyWith(_$StartConnectingImpl value,
          $Res Function(_$StartConnectingImpl) then) =
      __$$StartConnectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId, ConnectionOptions options});
}

/// @nodoc
class __$$StartConnectingImplCopyWithImpl<$Res>
    extends _$ConnectingEventCopyWithImpl<$Res, _$StartConnectingImpl>
    implements _$$StartConnectingImplCopyWith<$Res> {
  __$$StartConnectingImplCopyWithImpl(
      _$StartConnectingImpl _value, $Res Function(_$StartConnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? options = null,
  }) {
    return _then(_$StartConnectingImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as ConnectionOptions,
    ));
  }
}

/// @nodoc

class _$StartConnectingImpl implements StartConnecting {
  const _$StartConnectingImpl({required this.roomId, required this.options});

  @override
  final String roomId;
  @override
  final ConnectionOptions options;

  @override
  String toString() {
    return 'ConnectingEvent.startConnecting(roomId: $roomId, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartConnectingImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.options, options) || other.options == options));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, options);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartConnectingImplCopyWith<_$StartConnectingImpl> get copyWith =>
      __$$StartConnectingImplCopyWithImpl<_$StartConnectingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, ConnectionOptions options)
        startConnecting,
    required TResult Function() cancelConnection,
    required TResult Function() retryConnection,
  }) {
    return startConnecting(roomId, options);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, ConnectionOptions options)?
        startConnecting,
    TResult? Function()? cancelConnection,
    TResult? Function()? retryConnection,
  }) {
    return startConnecting?.call(roomId, options);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, ConnectionOptions options)? startConnecting,
    TResult Function()? cancelConnection,
    TResult Function()? retryConnection,
    required TResult orElse(),
  }) {
    if (startConnecting != null) {
      return startConnecting(roomId, options);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartConnecting value) startConnecting,
    required TResult Function(CancelConnection value) cancelConnection,
    required TResult Function(RetryConnection value) retryConnection,
  }) {
    return startConnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartConnecting value)? startConnecting,
    TResult? Function(CancelConnection value)? cancelConnection,
    TResult? Function(RetryConnection value)? retryConnection,
  }) {
    return startConnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartConnecting value)? startConnecting,
    TResult Function(CancelConnection value)? cancelConnection,
    TResult Function(RetryConnection value)? retryConnection,
    required TResult orElse(),
  }) {
    if (startConnecting != null) {
      return startConnecting(this);
    }
    return orElse();
  }
}

abstract class StartConnecting implements ConnectingEvent {
  const factory StartConnecting(
      {required final String roomId,
      required final ConnectionOptions options}) = _$StartConnectingImpl;

  String get roomId;
  ConnectionOptions get options;
  @JsonKey(ignore: true)
  _$$StartConnectingImplCopyWith<_$StartConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelConnectionImplCopyWith<$Res> {
  factory _$$CancelConnectionImplCopyWith(_$CancelConnectionImpl value,
          $Res Function(_$CancelConnectionImpl) then) =
      __$$CancelConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelConnectionImplCopyWithImpl<$Res>
    extends _$ConnectingEventCopyWithImpl<$Res, _$CancelConnectionImpl>
    implements _$$CancelConnectionImplCopyWith<$Res> {
  __$$CancelConnectionImplCopyWithImpl(_$CancelConnectionImpl _value,
      $Res Function(_$CancelConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelConnectionImpl implements CancelConnection {
  const _$CancelConnectionImpl();

  @override
  String toString() {
    return 'ConnectingEvent.cancelConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, ConnectionOptions options)
        startConnecting,
    required TResult Function() cancelConnection,
    required TResult Function() retryConnection,
  }) {
    return cancelConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, ConnectionOptions options)?
        startConnecting,
    TResult? Function()? cancelConnection,
    TResult? Function()? retryConnection,
  }) {
    return cancelConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, ConnectionOptions options)? startConnecting,
    TResult Function()? cancelConnection,
    TResult Function()? retryConnection,
    required TResult orElse(),
  }) {
    if (cancelConnection != null) {
      return cancelConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartConnecting value) startConnecting,
    required TResult Function(CancelConnection value) cancelConnection,
    required TResult Function(RetryConnection value) retryConnection,
  }) {
    return cancelConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartConnecting value)? startConnecting,
    TResult? Function(CancelConnection value)? cancelConnection,
    TResult? Function(RetryConnection value)? retryConnection,
  }) {
    return cancelConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartConnecting value)? startConnecting,
    TResult Function(CancelConnection value)? cancelConnection,
    TResult Function(RetryConnection value)? retryConnection,
    required TResult orElse(),
  }) {
    if (cancelConnection != null) {
      return cancelConnection(this);
    }
    return orElse();
  }
}

abstract class CancelConnection implements ConnectingEvent {
  const factory CancelConnection() = _$CancelConnectionImpl;
}

/// @nodoc
abstract class _$$RetryConnectionImplCopyWith<$Res> {
  factory _$$RetryConnectionImplCopyWith(_$RetryConnectionImpl value,
          $Res Function(_$RetryConnectionImpl) then) =
      __$$RetryConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetryConnectionImplCopyWithImpl<$Res>
    extends _$ConnectingEventCopyWithImpl<$Res, _$RetryConnectionImpl>
    implements _$$RetryConnectionImplCopyWith<$Res> {
  __$$RetryConnectionImplCopyWithImpl(
      _$RetryConnectionImpl _value, $Res Function(_$RetryConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RetryConnectionImpl implements RetryConnection {
  const _$RetryConnectionImpl();

  @override
  String toString() {
    return 'ConnectingEvent.retryConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetryConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, ConnectionOptions options)
        startConnecting,
    required TResult Function() cancelConnection,
    required TResult Function() retryConnection,
  }) {
    return retryConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, ConnectionOptions options)?
        startConnecting,
    TResult? Function()? cancelConnection,
    TResult? Function()? retryConnection,
  }) {
    return retryConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, ConnectionOptions options)? startConnecting,
    TResult Function()? cancelConnection,
    TResult Function()? retryConnection,
    required TResult orElse(),
  }) {
    if (retryConnection != null) {
      return retryConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartConnecting value) startConnecting,
    required TResult Function(CancelConnection value) cancelConnection,
    required TResult Function(RetryConnection value) retryConnection,
  }) {
    return retryConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartConnecting value)? startConnecting,
    TResult? Function(CancelConnection value)? cancelConnection,
    TResult? Function(RetryConnection value)? retryConnection,
  }) {
    return retryConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartConnecting value)? startConnecting,
    TResult Function(CancelConnection value)? cancelConnection,
    TResult Function(RetryConnection value)? retryConnection,
    required TResult orElse(),
  }) {
    if (retryConnection != null) {
      return retryConnection(this);
    }
    return orElse();
  }
}

abstract class RetryConnection implements ConnectingEvent {
  const factory RetryConnection() = _$RetryConnectionImpl;
}
