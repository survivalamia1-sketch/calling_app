// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewEventCopyWith<$Res> {
  factory $PreviewEventCopyWith(
          PreviewEvent value, $Res Function(PreviewEvent) then) =
      _$PreviewEventCopyWithImpl<$Res, PreviewEvent>;
}

/// @nodoc
class _$PreviewEventCopyWithImpl<$Res, $Val extends PreviewEvent>
    implements $PreviewEventCopyWith<$Res> {
  _$PreviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$InitializeImpl(
      null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl(this.roomId);

  @override
  final String roomId;

  @override
  String toString() {
    return 'PreviewEvent.initialize(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return initialize(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return initialize?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements PreviewEvent {
  const factory Initialize(final String roomId) = _$InitializeImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleCameraImplCopyWith<$Res> {
  factory _$$ToggleCameraImplCopyWith(
          _$ToggleCameraImpl value, $Res Function(_$ToggleCameraImpl) then) =
      __$$ToggleCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleCameraImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$ToggleCameraImpl>
    implements _$$ToggleCameraImplCopyWith<$Res> {
  __$$ToggleCameraImplCopyWithImpl(
      _$ToggleCameraImpl _value, $Res Function(_$ToggleCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleCameraImpl implements ToggleCamera {
  const _$ToggleCameraImpl();

  @override
  String toString() {
    return 'PreviewEvent.toggleCamera()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return toggleCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return toggleCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return toggleCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return toggleCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera(this);
    }
    return orElse();
  }
}

abstract class ToggleCamera implements PreviewEvent {
  const factory ToggleCamera() = _$ToggleCameraImpl;
}

/// @nodoc
abstract class _$$ToggleMicrophoneImplCopyWith<$Res> {
  factory _$$ToggleMicrophoneImplCopyWith(_$ToggleMicrophoneImpl value,
          $Res Function(_$ToggleMicrophoneImpl) then) =
      __$$ToggleMicrophoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleMicrophoneImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$ToggleMicrophoneImpl>
    implements _$$ToggleMicrophoneImplCopyWith<$Res> {
  __$$ToggleMicrophoneImplCopyWithImpl(_$ToggleMicrophoneImpl _value,
      $Res Function(_$ToggleMicrophoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleMicrophoneImpl implements ToggleMicrophone {
  const _$ToggleMicrophoneImpl();

  @override
  String toString() {
    return 'PreviewEvent.toggleMicrophone()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleMicrophoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return toggleMicrophone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return toggleMicrophone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (toggleMicrophone != null) {
      return toggleMicrophone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return toggleMicrophone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return toggleMicrophone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (toggleMicrophone != null) {
      return toggleMicrophone(this);
    }
    return orElse();
  }
}

abstract class ToggleMicrophone implements PreviewEvent {
  const factory ToggleMicrophone() = _$ToggleMicrophoneImpl;
}

/// @nodoc
abstract class _$$SwitchCameraImplCopyWith<$Res> {
  factory _$$SwitchCameraImplCopyWith(
          _$SwitchCameraImpl value, $Res Function(_$SwitchCameraImpl) then) =
      __$$SwitchCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchCameraImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$SwitchCameraImpl>
    implements _$$SwitchCameraImplCopyWith<$Res> {
  __$$SwitchCameraImplCopyWithImpl(
      _$SwitchCameraImpl _value, $Res Function(_$SwitchCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchCameraImpl implements SwitchCamera {
  const _$SwitchCameraImpl();

  @override
  String toString() {
    return 'PreviewEvent.switchCamera()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return switchCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return switchCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return switchCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return switchCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera(this);
    }
    return orElse();
  }
}

abstract class SwitchCamera implements PreviewEvent {
  const factory SwitchCamera() = _$SwitchCameraImpl;
}

/// @nodoc
abstract class _$$UpdateDisplayNameImplCopyWith<$Res> {
  factory _$$UpdateDisplayNameImplCopyWith(_$UpdateDisplayNameImpl value,
          $Res Function(_$UpdateDisplayNameImpl) then) =
      __$$UpdateDisplayNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UpdateDisplayNameImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$UpdateDisplayNameImpl>
    implements _$$UpdateDisplayNameImplCopyWith<$Res> {
  __$$UpdateDisplayNameImplCopyWithImpl(_$UpdateDisplayNameImpl _value,
      $Res Function(_$UpdateDisplayNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UpdateDisplayNameImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateDisplayNameImpl implements UpdateDisplayName {
  const _$UpdateDisplayNameImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'PreviewEvent.updateDisplayName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDisplayNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDisplayNameImplCopyWith<_$UpdateDisplayNameImpl> get copyWith =>
      __$$UpdateDisplayNameImplCopyWithImpl<_$UpdateDisplayNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return updateDisplayName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return updateDisplayName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (updateDisplayName != null) {
      return updateDisplayName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return updateDisplayName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return updateDisplayName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (updateDisplayName != null) {
      return updateDisplayName(this);
    }
    return orElse();
  }
}

abstract class UpdateDisplayName implements PreviewEvent {
  const factory UpdateDisplayName(final String name) = _$UpdateDisplayNameImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$UpdateDisplayNameImplCopyWith<_$UpdateDisplayNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestCameraPermissionImplCopyWith<$Res> {
  factory _$$RequestCameraPermissionImplCopyWith(
          _$RequestCameraPermissionImpl value,
          $Res Function(_$RequestCameraPermissionImpl) then) =
      __$$RequestCameraPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestCameraPermissionImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$RequestCameraPermissionImpl>
    implements _$$RequestCameraPermissionImplCopyWith<$Res> {
  __$$RequestCameraPermissionImplCopyWithImpl(
      _$RequestCameraPermissionImpl _value,
      $Res Function(_$RequestCameraPermissionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestCameraPermissionImpl implements RequestCameraPermission {
  const _$RequestCameraPermissionImpl();

  @override
  String toString() {
    return 'PreviewEvent.requestCameraPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCameraPermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return requestCameraPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return requestCameraPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (requestCameraPermission != null) {
      return requestCameraPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return requestCameraPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return requestCameraPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (requestCameraPermission != null) {
      return requestCameraPermission(this);
    }
    return orElse();
  }
}

abstract class RequestCameraPermission implements PreviewEvent {
  const factory RequestCameraPermission() = _$RequestCameraPermissionImpl;
}

/// @nodoc
abstract class _$$RequestMicrophonePermissionImplCopyWith<$Res> {
  factory _$$RequestMicrophonePermissionImplCopyWith(
          _$RequestMicrophonePermissionImpl value,
          $Res Function(_$RequestMicrophonePermissionImpl) then) =
      __$$RequestMicrophonePermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestMicrophonePermissionImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$RequestMicrophonePermissionImpl>
    implements _$$RequestMicrophonePermissionImplCopyWith<$Res> {
  __$$RequestMicrophonePermissionImplCopyWithImpl(
      _$RequestMicrophonePermissionImpl _value,
      $Res Function(_$RequestMicrophonePermissionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestMicrophonePermissionImpl implements RequestMicrophonePermission {
  const _$RequestMicrophonePermissionImpl();

  @override
  String toString() {
    return 'PreviewEvent.requestMicrophonePermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestMicrophonePermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return requestMicrophonePermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return requestMicrophonePermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (requestMicrophonePermission != null) {
      return requestMicrophonePermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return requestMicrophonePermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return requestMicrophonePermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (requestMicrophonePermission != null) {
      return requestMicrophonePermission(this);
    }
    return orElse();
  }
}

abstract class RequestMicrophonePermission implements PreviewEvent {
  const factory RequestMicrophonePermission() =
      _$RequestMicrophonePermissionImpl;
}

/// @nodoc
abstract class _$$OpenSettingsImplCopyWith<$Res> {
  factory _$$OpenSettingsImplCopyWith(
          _$OpenSettingsImpl value, $Res Function(_$OpenSettingsImpl) then) =
      __$$OpenSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenSettingsImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$OpenSettingsImpl>
    implements _$$OpenSettingsImplCopyWith<$Res> {
  __$$OpenSettingsImplCopyWithImpl(
      _$OpenSettingsImpl _value, $Res Function(_$OpenSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OpenSettingsImpl implements OpenSettings {
  const _$OpenSettingsImpl();

  @override
  String toString() {
    return 'PreviewEvent.openSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return openSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return openSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (openSettings != null) {
      return openSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return openSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return openSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (openSettings != null) {
      return openSettings(this);
    }
    return orElse();
  }
}

abstract class OpenSettings implements PreviewEvent {
  const factory OpenSettings() = _$OpenSettingsImpl;
}

/// @nodoc
abstract class _$$JoinMeetingImplCopyWith<$Res> {
  factory _$$JoinMeetingImplCopyWith(
          _$JoinMeetingImpl value, $Res Function(_$JoinMeetingImpl) then) =
      __$$JoinMeetingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JoinMeetingImplCopyWithImpl<$Res>
    extends _$PreviewEventCopyWithImpl<$Res, _$JoinMeetingImpl>
    implements _$$JoinMeetingImplCopyWith<$Res> {
  __$$JoinMeetingImplCopyWithImpl(
      _$JoinMeetingImpl _value, $Res Function(_$JoinMeetingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JoinMeetingImpl implements JoinMeeting {
  const _$JoinMeetingImpl();

  @override
  String toString() {
    return 'PreviewEvent.joinMeeting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JoinMeetingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) initialize,
    required TResult Function() toggleCamera,
    required TResult Function() toggleMicrophone,
    required TResult Function() switchCamera,
    required TResult Function(String name) updateDisplayName,
    required TResult Function() requestCameraPermission,
    required TResult Function() requestMicrophonePermission,
    required TResult Function() openSettings,
    required TResult Function() joinMeeting,
  }) {
    return joinMeeting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? initialize,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleMicrophone,
    TResult? Function()? switchCamera,
    TResult? Function(String name)? updateDisplayName,
    TResult? Function()? requestCameraPermission,
    TResult? Function()? requestMicrophonePermission,
    TResult? Function()? openSettings,
    TResult? Function()? joinMeeting,
  }) {
    return joinMeeting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? initialize,
    TResult Function()? toggleCamera,
    TResult Function()? toggleMicrophone,
    TResult Function()? switchCamera,
    TResult Function(String name)? updateDisplayName,
    TResult Function()? requestCameraPermission,
    TResult Function()? requestMicrophonePermission,
    TResult Function()? openSettings,
    TResult Function()? joinMeeting,
    required TResult orElse(),
  }) {
    if (joinMeeting != null) {
      return joinMeeting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ToggleCamera value) toggleCamera,
    required TResult Function(ToggleMicrophone value) toggleMicrophone,
    required TResult Function(SwitchCamera value) switchCamera,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(RequestCameraPermission value)
        requestCameraPermission,
    required TResult Function(RequestMicrophonePermission value)
        requestMicrophonePermission,
    required TResult Function(OpenSettings value) openSettings,
    required TResult Function(JoinMeeting value) joinMeeting,
  }) {
    return joinMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(ToggleCamera value)? toggleCamera,
    TResult? Function(ToggleMicrophone value)? toggleMicrophone,
    TResult? Function(SwitchCamera value)? switchCamera,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(RequestCameraPermission value)? requestCameraPermission,
    TResult? Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult? Function(OpenSettings value)? openSettings,
    TResult? Function(JoinMeeting value)? joinMeeting,
  }) {
    return joinMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ToggleCamera value)? toggleCamera,
    TResult Function(ToggleMicrophone value)? toggleMicrophone,
    TResult Function(SwitchCamera value)? switchCamera,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(RequestCameraPermission value)? requestCameraPermission,
    TResult Function(RequestMicrophonePermission value)?
        requestMicrophonePermission,
    TResult Function(OpenSettings value)? openSettings,
    TResult Function(JoinMeeting value)? joinMeeting,
    required TResult orElse(),
  }) {
    if (joinMeeting != null) {
      return joinMeeting(this);
    }
    return orElse();
  }
}

abstract class JoinMeeting implements PreviewEvent {
  const factory JoinMeeting() = _$JoinMeetingImpl;
}
