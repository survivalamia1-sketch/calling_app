// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CallEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallEventCopyWith<$Res> {
  factory $CallEventCopyWith(CallEvent value, $Res Function(CallEvent) then) =
      _$CallEventCopyWithImpl<$Res, CallEvent>;
}

/// @nodoc
class _$CallEventCopyWithImpl<$Res, $Val extends CallEvent>
    implements $CallEventCopyWith<$Res> {
  _$CallEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$JoinCallImplCopyWith<$Res> {
  factory _$$JoinCallImplCopyWith(
          _$JoinCallImpl value, $Res Function(_$JoinCallImpl) then) =
      __$$JoinCallImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$JoinCallImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$JoinCallImpl>
    implements _$$JoinCallImplCopyWith<$Res> {
  __$$JoinCallImplCopyWithImpl(
      _$JoinCallImpl _value, $Res Function(_$JoinCallImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$JoinCallImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JoinCallImpl implements _JoinCall {
  const _$JoinCallImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'CallEvent.joinCall(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinCallImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinCallImplCopyWith<_$JoinCallImpl> get copyWith =>
      __$$JoinCallImplCopyWithImpl<_$JoinCallImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) {
    return joinCall(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) {
    return joinCall?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
    required TResult orElse(),
  }) {
    if (joinCall != null) {
      return joinCall(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) {
    return joinCall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) {
    return joinCall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) {
    if (joinCall != null) {
      return joinCall(this);
    }
    return orElse();
  }
}

abstract class _JoinCall implements CallEvent {
  const factory _JoinCall({required final String roomId}) = _$JoinCallImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$JoinCallImplCopyWith<_$JoinCallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaveCallImplCopyWith<$Res> {
  factory _$$LeaveCallImplCopyWith(
          _$LeaveCallImpl value, $Res Function(_$LeaveCallImpl) then) =
      __$$LeaveCallImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LeaveCallImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$LeaveCallImpl>
    implements _$$LeaveCallImplCopyWith<$Res> {
  __$$LeaveCallImplCopyWithImpl(
      _$LeaveCallImpl _value, $Res Function(_$LeaveCallImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LeaveCallImpl implements _LeaveCall {
  const _$LeaveCallImpl();

  @override
  String toString() {
    return 'CallEvent.leaveCall()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LeaveCallImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) {
    return leaveCall();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) {
    return leaveCall?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
    required TResult orElse(),
  }) {
    if (leaveCall != null) {
      return leaveCall();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) {
    return leaveCall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) {
    return leaveCall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) {
    if (leaveCall != null) {
      return leaveCall(this);
    }
    return orElse();
  }
}

abstract class _LeaveCall implements CallEvent {
  const factory _LeaveCall() = _$LeaveCallImpl;
}

/// @nodoc
abstract class _$$ToggleAudioImplCopyWith<$Res> {
  factory _$$ToggleAudioImplCopyWith(
          _$ToggleAudioImpl value, $Res Function(_$ToggleAudioImpl) then) =
      __$$ToggleAudioImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleAudioImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$ToggleAudioImpl>
    implements _$$ToggleAudioImplCopyWith<$Res> {
  __$$ToggleAudioImplCopyWithImpl(
      _$ToggleAudioImpl _value, $Res Function(_$ToggleAudioImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleAudioImpl implements _ToggleAudio {
  const _$ToggleAudioImpl();

  @override
  String toString() {
    return 'CallEvent.toggleAudio()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleAudioImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) {
    return toggleAudio();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) {
    return toggleAudio?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
    required TResult orElse(),
  }) {
    if (toggleAudio != null) {
      return toggleAudio();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) {
    return toggleAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) {
    return toggleAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) {
    if (toggleAudio != null) {
      return toggleAudio(this);
    }
    return orElse();
  }
}

abstract class _ToggleAudio implements CallEvent {
  const factory _ToggleAudio() = _$ToggleAudioImpl;
}

/// @nodoc
abstract class _$$ToggleVideoImplCopyWith<$Res> {
  factory _$$ToggleVideoImplCopyWith(
          _$ToggleVideoImpl value, $Res Function(_$ToggleVideoImpl) then) =
      __$$ToggleVideoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleVideoImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$ToggleVideoImpl>
    implements _$$ToggleVideoImplCopyWith<$Res> {
  __$$ToggleVideoImplCopyWithImpl(
      _$ToggleVideoImpl _value, $Res Function(_$ToggleVideoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleVideoImpl implements _ToggleVideo {
  const _$ToggleVideoImpl();

  @override
  String toString() {
    return 'CallEvent.toggleVideo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleVideoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) {
    return toggleVideo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) {
    return toggleVideo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
    required TResult orElse(),
  }) {
    if (toggleVideo != null) {
      return toggleVideo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) {
    return toggleVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) {
    return toggleVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) {
    if (toggleVideo != null) {
      return toggleVideo(this);
    }
    return orElse();
  }
}

abstract class _ToggleVideo implements CallEvent {
  const factory _ToggleVideo() = _$ToggleVideoImpl;
}

/// @nodoc
abstract class _$$SwitchCameraImplCopyWith<$Res> {
  factory _$$SwitchCameraImplCopyWith(
          _$SwitchCameraImpl value, $Res Function(_$SwitchCameraImpl) then) =
      __$$SwitchCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchCameraImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$SwitchCameraImpl>
    implements _$$SwitchCameraImplCopyWith<$Res> {
  __$$SwitchCameraImplCopyWithImpl(
      _$SwitchCameraImpl _value, $Res Function(_$SwitchCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchCameraImpl implements _SwitchCamera {
  const _$SwitchCameraImpl();

  @override
  String toString() {
    return 'CallEvent.switchCamera()';
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
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) {
    return switchCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) {
    return switchCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
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
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) {
    return switchCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) {
    return switchCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) {
    if (switchCamera != null) {
      return switchCamera(this);
    }
    return orElse();
  }
}

abstract class _SwitchCamera implements CallEvent {
  const factory _SwitchCamera() = _$SwitchCameraImpl;
}

/// @nodoc
abstract class _$$UpdateCallImplCopyWith<$Res> {
  factory _$$UpdateCallImplCopyWith(
          _$UpdateCallImpl value, $Res Function(_$UpdateCallImpl) then) =
      __$$UpdateCallImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Call call});
}

/// @nodoc
class __$$UpdateCallImplCopyWithImpl<$Res>
    extends _$CallEventCopyWithImpl<$Res, _$UpdateCallImpl>
    implements _$$UpdateCallImplCopyWith<$Res> {
  __$$UpdateCallImplCopyWithImpl(
      _$UpdateCallImpl _value, $Res Function(_$UpdateCallImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? call = null,
  }) {
    return _then(_$UpdateCallImpl(
      call: null == call
          ? _value.call
          : call // ignore: cast_nullable_to_non_nullable
              as Call,
    ));
  }
}

/// @nodoc

class _$UpdateCallImpl implements _UpdateCall {
  const _$UpdateCallImpl({required this.call});

  @override
  final Call call;

  @override
  String toString() {
    return 'CallEvent.updateCall(call: $call)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCallImpl &&
            (identical(other.call, call) || other.call == call));
  }

  @override
  int get hashCode => Object.hash(runtimeType, call);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCallImplCopyWith<_$UpdateCallImpl> get copyWith =>
      __$$UpdateCallImplCopyWithImpl<_$UpdateCallImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinCall,
    required TResult Function() leaveCall,
    required TResult Function() toggleAudio,
    required TResult Function() toggleVideo,
    required TResult Function() switchCamera,
    required TResult Function(Call call) updateCall,
  }) {
    return updateCall(call);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinCall,
    TResult? Function()? leaveCall,
    TResult? Function()? toggleAudio,
    TResult? Function()? toggleVideo,
    TResult? Function()? switchCamera,
    TResult? Function(Call call)? updateCall,
  }) {
    return updateCall?.call(call);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinCall,
    TResult Function()? leaveCall,
    TResult Function()? toggleAudio,
    TResult Function()? toggleVideo,
    TResult Function()? switchCamera,
    TResult Function(Call call)? updateCall,
    required TResult orElse(),
  }) {
    if (updateCall != null) {
      return updateCall(call);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_LeaveCall value) leaveCall,
    required TResult Function(_ToggleAudio value) toggleAudio,
    required TResult Function(_ToggleVideo value) toggleVideo,
    required TResult Function(_SwitchCamera value) switchCamera,
    required TResult Function(_UpdateCall value) updateCall,
  }) {
    return updateCall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_LeaveCall value)? leaveCall,
    TResult? Function(_ToggleAudio value)? toggleAudio,
    TResult? Function(_ToggleVideo value)? toggleVideo,
    TResult? Function(_SwitchCamera value)? switchCamera,
    TResult? Function(_UpdateCall value)? updateCall,
  }) {
    return updateCall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_LeaveCall value)? leaveCall,
    TResult Function(_ToggleAudio value)? toggleAudio,
    TResult Function(_ToggleVideo value)? toggleVideo,
    TResult Function(_SwitchCamera value)? switchCamera,
    TResult Function(_UpdateCall value)? updateCall,
    required TResult orElse(),
  }) {
    if (updateCall != null) {
      return updateCall(this);
    }
    return orElse();
  }
}

abstract class _UpdateCall implements CallEvent {
  const factory _UpdateCall({required final Call call}) = _$UpdateCallImpl;

  Call get call;
  @JsonKey(ignore: true)
  _$$UpdateCallImplCopyWith<_$UpdateCallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CallState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)
        connected,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallStateCopyWith<$Res> {
  factory $CallStateCopyWith(CallState value, $Res Function(CallState) then) =
      _$CallStateCopyWithImpl<$Res, CallState>;
}

/// @nodoc
class _$CallStateCopyWithImpl<$Res, $Val extends CallState>
    implements $CallStateCopyWith<$Res> {
  _$CallStateCopyWithImpl(this._value, this._then);

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
    extends _$CallStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CallState.initial()';
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
    required TResult Function() connecting,
    required TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)
        connected,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult Function()? disconnected,
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
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CallState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$CallStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectingImpl implements _Connecting {
  const _$ConnectingImpl();

  @override
  String toString() {
    return 'CallState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)
        connected,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements CallState {
  const factory _Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Call call,
      RTCVideoRenderer localRenderer,
      Map<String, RTCVideoRenderer> remoteRenderers});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$CallStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? call = null,
    Object? localRenderer = null,
    Object? remoteRenderers = null,
  }) {
    return _then(_$ConnectedImpl(
      call: null == call
          ? _value.call
          : call // ignore: cast_nullable_to_non_nullable
              as Call,
      localRenderer: null == localRenderer
          ? _value.localRenderer
          : localRenderer // ignore: cast_nullable_to_non_nullable
              as RTCVideoRenderer,
      remoteRenderers: null == remoteRenderers
          ? _value._remoteRenderers
          : remoteRenderers // ignore: cast_nullable_to_non_nullable
              as Map<String, RTCVideoRenderer>,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl(
      {required this.call,
      required this.localRenderer,
      required final Map<String, RTCVideoRenderer> remoteRenderers})
      : _remoteRenderers = remoteRenderers;

  @override
  final Call call;
  @override
  final RTCVideoRenderer localRenderer;
  final Map<String, RTCVideoRenderer> _remoteRenderers;
  @override
  Map<String, RTCVideoRenderer> get remoteRenderers {
    if (_remoteRenderers is EqualUnmodifiableMapView) return _remoteRenderers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_remoteRenderers);
  }

  @override
  String toString() {
    return 'CallState.connected(call: $call, localRenderer: $localRenderer, remoteRenderers: $remoteRenderers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.call, call) || other.call == call) &&
            (identical(other.localRenderer, localRenderer) ||
                other.localRenderer == localRenderer) &&
            const DeepCollectionEquality()
                .equals(other._remoteRenderers, _remoteRenderers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, call, localRenderer,
      const DeepCollectionEquality().hash(_remoteRenderers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)
        connected,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return connected(call, localRenderer, remoteRenderers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return connected?.call(call, localRenderer, remoteRenderers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(call, localRenderer, remoteRenderers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements CallState {
  const factory _Connected(
          {required final Call call,
          required final RTCVideoRenderer localRenderer,
          required final Map<String, RTCVideoRenderer> remoteRenderers}) =
      _$ConnectedImpl;

  Call get call;
  RTCVideoRenderer get localRenderer;
  Map<String, RTCVideoRenderer> get remoteRenderers;
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$CallStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisconnectedImpl implements _Disconnected {
  const _$DisconnectedImpl();

  @override
  String toString() {
    return 'CallState.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)
        connected,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements CallState {
  const factory _Disconnected() = _$DisconnectedImpl;
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
    extends _$CallStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'CallState.error(message: $message)';
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
    required TResult Function() connecting,
    required TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)
        connected,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(Call call, RTCVideoRenderer localRenderer,
            Map<String, RTCVideoRenderer> remoteRenderers)?
        connected,
    TResult Function()? disconnected,
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
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CallState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
