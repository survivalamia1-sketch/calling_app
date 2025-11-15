// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meetings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeetingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingsStateCopyWith<$Res> {
  factory $MeetingsStateCopyWith(
          MeetingsState value, $Res Function(MeetingsState) then) =
      _$MeetingsStateCopyWithImpl<$Res, MeetingsState>;
}

/// @nodoc
class _$MeetingsStateCopyWithImpl<$Res, $Val extends MeetingsState>
    implements $MeetingsStateCopyWith<$Res> {
  _$MeetingsStateCopyWithImpl(this._value, this._then);

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
    extends _$MeetingsStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MeetingsState.initial()';
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
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MeetingsState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MeetingsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MeetingsState.loading()';
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
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements MeetingsState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Meeting> meetings});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MeetingsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meetings = null,
  }) {
    return _then(_$LoadedImpl(
      meetings: null == meetings
          ? _value._meetings
          : meetings // ignore: cast_nullable_to_non_nullable
              as List<Meeting>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl({required final List<Meeting> meetings})
      : _meetings = meetings;

  final List<Meeting> _meetings;
  @override
  List<Meeting> get meetings {
    if (_meetings is EqualUnmodifiableListView) return _meetings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meetings);
  }

  @override
  String toString() {
    return 'MeetingsState.loaded(meetings: $meetings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._meetings, _meetings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meetings));

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
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(meetings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(meetings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(meetings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements MeetingsState {
  const factory Loaded({required final List<Meeting> meetings}) = _$LoadedImpl;

  List<Meeting> get meetings;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeetingCreatedImplCopyWith<$Res> {
  factory _$$MeetingCreatedImplCopyWith(_$MeetingCreatedImpl value,
          $Res Function(_$MeetingCreatedImpl) then) =
      __$$MeetingCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Meeting meeting});
}

/// @nodoc
class __$$MeetingCreatedImplCopyWithImpl<$Res>
    extends _$MeetingsStateCopyWithImpl<$Res, _$MeetingCreatedImpl>
    implements _$$MeetingCreatedImplCopyWith<$Res> {
  __$$MeetingCreatedImplCopyWithImpl(
      _$MeetingCreatedImpl _value, $Res Function(_$MeetingCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meeting = null,
  }) {
    return _then(_$MeetingCreatedImpl(
      meeting: null == meeting
          ? _value.meeting
          : meeting // ignore: cast_nullable_to_non_nullable
              as Meeting,
    ));
  }
}

/// @nodoc

class _$MeetingCreatedImpl implements MeetingCreated {
  const _$MeetingCreatedImpl({required this.meeting});

  @override
  final Meeting meeting;

  @override
  String toString() {
    return 'MeetingsState.meetingCreated(meeting: $meeting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingCreatedImpl &&
            (identical(other.meeting, meeting) || other.meeting == meeting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meeting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingCreatedImplCopyWith<_$MeetingCreatedImpl> get copyWith =>
      __$$MeetingCreatedImplCopyWithImpl<_$MeetingCreatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) {
    return meetingCreated(meeting);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) {
    return meetingCreated?.call(meeting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (meetingCreated != null) {
      return meetingCreated(meeting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) {
    return meetingCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) {
    return meetingCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (meetingCreated != null) {
      return meetingCreated(this);
    }
    return orElse();
  }
}

abstract class MeetingCreated implements MeetingsState {
  const factory MeetingCreated({required final Meeting meeting}) =
      _$MeetingCreatedImpl;

  Meeting get meeting;
  @JsonKey(ignore: true)
  _$$MeetingCreatedImplCopyWith<_$MeetingCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JoinedMeetingImplCopyWith<$Res> {
  factory _$$JoinedMeetingImplCopyWith(
          _$JoinedMeetingImpl value, $Res Function(_$JoinedMeetingImpl) then) =
      __$$JoinedMeetingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$JoinedMeetingImplCopyWithImpl<$Res>
    extends _$MeetingsStateCopyWithImpl<$Res, _$JoinedMeetingImpl>
    implements _$$JoinedMeetingImplCopyWith<$Res> {
  __$$JoinedMeetingImplCopyWithImpl(
      _$JoinedMeetingImpl _value, $Res Function(_$JoinedMeetingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$JoinedMeetingImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JoinedMeetingImpl implements JoinedMeeting {
  const _$JoinedMeetingImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'MeetingsState.joinedMeeting(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinedMeetingImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinedMeetingImplCopyWith<_$JoinedMeetingImpl> get copyWith =>
      __$$JoinedMeetingImplCopyWithImpl<_$JoinedMeetingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) {
    return joinedMeeting(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) {
    return joinedMeeting?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (joinedMeeting != null) {
      return joinedMeeting(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) {
    return joinedMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) {
    return joinedMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (joinedMeeting != null) {
      return joinedMeeting(this);
    }
    return orElse();
  }
}

abstract class JoinedMeeting implements MeetingsState {
  const factory JoinedMeeting({required final String roomId}) =
      _$JoinedMeetingImpl;

  String get roomId;
  @JsonKey(ignore: true)
  _$$JoinedMeetingImplCopyWith<_$JoinedMeetingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MeetingsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'MeetingsState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

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
    required TResult Function(List<Meeting> meetings) loaded,
    required TResult Function(Meeting meeting) meetingCreated,
    required TResult Function(String roomId) joinedMeeting,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meeting> meetings)? loaded,
    TResult? Function(Meeting meeting)? meetingCreated,
    TResult? Function(String roomId)? joinedMeeting,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meeting> meetings)? loaded,
    TResult Function(Meeting meeting)? meetingCreated,
    TResult Function(String roomId)? joinedMeeting,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(MeetingCreated value) meetingCreated,
    required TResult Function(JoinedMeeting value) joinedMeeting,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(MeetingCreated value)? meetingCreated,
    TResult? Function(JoinedMeeting value)? joinedMeeting,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(MeetingCreated value)? meetingCreated,
    TResult Function(JoinedMeeting value)? joinedMeeting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MeetingsState {
  const factory Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
