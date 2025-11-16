// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit) loadNotifications,
    required TResult Function(int limit) refreshNotifications,
    required TResult Function(String notificationId) markAsRead,
    required TResult Function() markAllAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit)? loadNotifications,
    TResult? Function(int limit)? refreshNotifications,
    TResult? Function(String notificationId)? markAsRead,
    TResult? Function()? markAllAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit)? loadNotifications,
    TResult Function(int limit)? refreshNotifications,
    TResult Function(String notificationId)? markAsRead,
    TResult Function()? markAllAsRead,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_RefreshNotifications value) refreshNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_RefreshNotifications value)? refreshNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_RefreshNotifications value)? refreshNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadNotificationsImplCopyWith<$Res> {
  factory _$$LoadNotificationsImplCopyWith(_$LoadNotificationsImpl value,
          $Res Function(_$LoadNotificationsImpl) then) =
      __$$LoadNotificationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$$LoadNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$LoadNotificationsImpl>
    implements _$$LoadNotificationsImplCopyWith<$Res> {
  __$$LoadNotificationsImplCopyWithImpl(_$LoadNotificationsImpl _value,
      $Res Function(_$LoadNotificationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_$LoadNotificationsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadNotificationsImpl implements _LoadNotifications {
  const _$LoadNotificationsImpl({this.limit = 50});

  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NotificationsEvent.loadNotifications(limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNotificationsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadNotificationsImplCopyWith<_$LoadNotificationsImpl> get copyWith =>
      __$$LoadNotificationsImplCopyWithImpl<_$LoadNotificationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit) loadNotifications,
    required TResult Function(int limit) refreshNotifications,
    required TResult Function(String notificationId) markAsRead,
    required TResult Function() markAllAsRead,
  }) {
    return loadNotifications(limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit)? loadNotifications,
    TResult? Function(int limit)? refreshNotifications,
    TResult? Function(String notificationId)? markAsRead,
    TResult? Function()? markAllAsRead,
  }) {
    return loadNotifications?.call(limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit)? loadNotifications,
    TResult Function(int limit)? refreshNotifications,
    TResult Function(String notificationId)? markAsRead,
    TResult Function()? markAllAsRead,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_RefreshNotifications value) refreshNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_RefreshNotifications value)? refreshNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_RefreshNotifications value)? refreshNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(this);
    }
    return orElse();
  }
}

abstract class _LoadNotifications implements NotificationsEvent {
  const factory _LoadNotifications({final int limit}) = _$LoadNotificationsImpl;

  int get limit;
  @JsonKey(ignore: true)
  _$$LoadNotificationsImplCopyWith<_$LoadNotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshNotificationsImplCopyWith<$Res> {
  factory _$$RefreshNotificationsImplCopyWith(_$RefreshNotificationsImpl value,
          $Res Function(_$RefreshNotificationsImpl) then) =
      __$$RefreshNotificationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$$RefreshNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$RefreshNotificationsImpl>
    implements _$$RefreshNotificationsImplCopyWith<$Res> {
  __$$RefreshNotificationsImplCopyWithImpl(_$RefreshNotificationsImpl _value,
      $Res Function(_$RefreshNotificationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_$RefreshNotificationsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RefreshNotificationsImpl implements _RefreshNotifications {
  const _$RefreshNotificationsImpl({this.limit = 50});

  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NotificationsEvent.refreshNotifications(limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshNotificationsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshNotificationsImplCopyWith<_$RefreshNotificationsImpl>
      get copyWith =>
          __$$RefreshNotificationsImplCopyWithImpl<_$RefreshNotificationsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit) loadNotifications,
    required TResult Function(int limit) refreshNotifications,
    required TResult Function(String notificationId) markAsRead,
    required TResult Function() markAllAsRead,
  }) {
    return refreshNotifications(limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit)? loadNotifications,
    TResult? Function(int limit)? refreshNotifications,
    TResult? Function(String notificationId)? markAsRead,
    TResult? Function()? markAllAsRead,
  }) {
    return refreshNotifications?.call(limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit)? loadNotifications,
    TResult Function(int limit)? refreshNotifications,
    TResult Function(String notificationId)? markAsRead,
    TResult Function()? markAllAsRead,
    required TResult orElse(),
  }) {
    if (refreshNotifications != null) {
      return refreshNotifications(limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_RefreshNotifications value) refreshNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
  }) {
    return refreshNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_RefreshNotifications value)? refreshNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
  }) {
    return refreshNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_RefreshNotifications value)? refreshNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    required TResult orElse(),
  }) {
    if (refreshNotifications != null) {
      return refreshNotifications(this);
    }
    return orElse();
  }
}

abstract class _RefreshNotifications implements NotificationsEvent {
  const factory _RefreshNotifications({final int limit}) =
      _$RefreshNotificationsImpl;

  int get limit;
  @JsonKey(ignore: true)
  _$$RefreshNotificationsImplCopyWith<_$RefreshNotificationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsReadImplCopyWith<$Res> {
  factory _$$MarkAsReadImplCopyWith(
          _$MarkAsReadImpl value, $Res Function(_$MarkAsReadImpl) then) =
      __$$MarkAsReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String notificationId});
}

/// @nodoc
class __$$MarkAsReadImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$MarkAsReadImpl>
    implements _$$MarkAsReadImplCopyWith<$Res> {
  __$$MarkAsReadImplCopyWithImpl(
      _$MarkAsReadImpl _value, $Res Function(_$MarkAsReadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
  }) {
    return _then(_$MarkAsReadImpl(
      null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsReadImpl implements _MarkAsRead {
  const _$MarkAsReadImpl(this.notificationId);

  @override
  final String notificationId;

  @override
  String toString() {
    return 'NotificationsEvent.markAsRead(notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsReadImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      __$$MarkAsReadImplCopyWithImpl<_$MarkAsReadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit) loadNotifications,
    required TResult Function(int limit) refreshNotifications,
    required TResult Function(String notificationId) markAsRead,
    required TResult Function() markAllAsRead,
  }) {
    return markAsRead(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit)? loadNotifications,
    TResult? Function(int limit)? refreshNotifications,
    TResult? Function(String notificationId)? markAsRead,
    TResult? Function()? markAllAsRead,
  }) {
    return markAsRead?.call(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit)? loadNotifications,
    TResult Function(int limit)? refreshNotifications,
    TResult Function(String notificationId)? markAsRead,
    TResult Function()? markAllAsRead,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(notificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_RefreshNotifications value) refreshNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
  }) {
    return markAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_RefreshNotifications value)? refreshNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
  }) {
    return markAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_RefreshNotifications value)? refreshNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkAsRead implements NotificationsEvent {
  const factory _MarkAsRead(final String notificationId) = _$MarkAsReadImpl;

  String get notificationId;
  @JsonKey(ignore: true)
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAllAsReadImplCopyWith<$Res> {
  factory _$$MarkAllAsReadImplCopyWith(
          _$MarkAllAsReadImpl value, $Res Function(_$MarkAllAsReadImpl) then) =
      __$$MarkAllAsReadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkAllAsReadImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$MarkAllAsReadImpl>
    implements _$$MarkAllAsReadImplCopyWith<$Res> {
  __$$MarkAllAsReadImplCopyWithImpl(
      _$MarkAllAsReadImpl _value, $Res Function(_$MarkAllAsReadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MarkAllAsReadImpl implements _MarkAllAsRead {
  const _$MarkAllAsReadImpl();

  @override
  String toString() {
    return 'NotificationsEvent.markAllAsRead()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkAllAsReadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit) loadNotifications,
    required TResult Function(int limit) refreshNotifications,
    required TResult Function(String notificationId) markAsRead,
    required TResult Function() markAllAsRead,
  }) {
    return markAllAsRead();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit)? loadNotifications,
    TResult? Function(int limit)? refreshNotifications,
    TResult? Function(String notificationId)? markAsRead,
    TResult? Function()? markAllAsRead,
  }) {
    return markAllAsRead?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit)? loadNotifications,
    TResult Function(int limit)? refreshNotifications,
    TResult Function(String notificationId)? markAsRead,
    TResult Function()? markAllAsRead,
    required TResult orElse(),
  }) {
    if (markAllAsRead != null) {
      return markAllAsRead();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_RefreshNotifications value) refreshNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
  }) {
    return markAllAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_RefreshNotifications value)? refreshNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
  }) {
    return markAllAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_RefreshNotifications value)? refreshNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    required TResult orElse(),
  }) {
    if (markAllAsRead != null) {
      return markAllAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkAllAsRead implements NotificationsEvent {
  const factory _MarkAllAsRead() = _$MarkAllAsReadImpl;
}

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationItem> notifications, int unreadCount)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

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
    extends _$NotificationsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationsState.initial()';
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
    required TResult Function() loading,
    required TResult Function(
            List<NotificationItem> notifications, int unreadCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationItem> notifications, int unreadCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NotificationsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationItem> notifications, int unreadCount});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
  }) {
    return _then(_$LoadedImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationItem>,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<NotificationItem> notifications,
      required this.unreadCount})
      : _notifications = notifications;

  final List<NotificationItem> _notifications;
  @override
  List<NotificationItem> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final int unreadCount;

  @override
  String toString() {
    return 'NotificationsState.loaded(notifications: $notifications, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_notifications), unreadCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationItem> notifications, int unreadCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(notifications, unreadCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(notifications, unreadCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(notifications, unreadCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements NotificationsState {
  const factory _Loaded(
      {required final List<NotificationItem> notifications,
      required final int unreadCount}) = _$LoadedImpl;

  List<NotificationItem> get notifications;
  int get unreadCount;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationItem> notifications, int unreadCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationItem> notifications, int unreadCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NotificationsState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
