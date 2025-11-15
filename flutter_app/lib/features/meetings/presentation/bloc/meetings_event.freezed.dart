// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meetings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeetingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) loadMeetings,
    required TResult Function(
            String title,
            String description,
            DateTime scheduledAt,
            int? duration,
            int? maxParticipants,
            bool? requiresApproval)
        createMeeting,
    required TResult Function(String roomCode) joinMeeting,
    required TResult Function(String id) deleteMeeting,
    required TResult Function() refreshMeetings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? loadMeetings,
    TResult? Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult? Function(String roomCode)? joinMeeting,
    TResult? Function(String id)? deleteMeeting,
    TResult? Function()? refreshMeetings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? loadMeetings,
    TResult Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult Function(String roomCode)? joinMeeting,
    TResult Function(String id)? deleteMeeting,
    TResult Function()? refreshMeetings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMeetings value) loadMeetings,
    required TResult Function(CreateMeeting value) createMeeting,
    required TResult Function(JoinMeeting value) joinMeeting,
    required TResult Function(DeleteMeeting value) deleteMeeting,
    required TResult Function(RefreshMeetings value) refreshMeetings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMeetings value)? loadMeetings,
    TResult? Function(CreateMeeting value)? createMeeting,
    TResult? Function(JoinMeeting value)? joinMeeting,
    TResult? Function(DeleteMeeting value)? deleteMeeting,
    TResult? Function(RefreshMeetings value)? refreshMeetings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMeetings value)? loadMeetings,
    TResult Function(CreateMeeting value)? createMeeting,
    TResult Function(JoinMeeting value)? joinMeeting,
    TResult Function(DeleteMeeting value)? deleteMeeting,
    TResult Function(RefreshMeetings value)? refreshMeetings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingsEventCopyWith<$Res> {
  factory $MeetingsEventCopyWith(
          MeetingsEvent value, $Res Function(MeetingsEvent) then) =
      _$MeetingsEventCopyWithImpl<$Res, MeetingsEvent>;
}

/// @nodoc
class _$MeetingsEventCopyWithImpl<$Res, $Val extends MeetingsEvent>
    implements $MeetingsEventCopyWith<$Res> {
  _$MeetingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadMeetingsImplCopyWith<$Res> {
  factory _$$LoadMeetingsImplCopyWith(
          _$LoadMeetingsImpl value, $Res Function(_$LoadMeetingsImpl) then) =
      __$$LoadMeetingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$LoadMeetingsImplCopyWithImpl<$Res>
    extends _$MeetingsEventCopyWithImpl<$Res, _$LoadMeetingsImpl>
    implements _$$LoadMeetingsImplCopyWith<$Res> {
  __$$LoadMeetingsImplCopyWithImpl(
      _$LoadMeetingsImpl _value, $Res Function(_$LoadMeetingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$LoadMeetingsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadMeetingsImpl implements LoadMeetings {
  const _$LoadMeetingsImpl({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'MeetingsEvent.loadMeetings(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMeetingsImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMeetingsImplCopyWith<_$LoadMeetingsImpl> get copyWith =>
      __$$LoadMeetingsImplCopyWithImpl<_$LoadMeetingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) loadMeetings,
    required TResult Function(
            String title,
            String description,
            DateTime scheduledAt,
            int? duration,
            int? maxParticipants,
            bool? requiresApproval)
        createMeeting,
    required TResult Function(String roomCode) joinMeeting,
    required TResult Function(String id) deleteMeeting,
    required TResult Function() refreshMeetings,
  }) {
    return loadMeetings(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? loadMeetings,
    TResult? Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult? Function(String roomCode)? joinMeeting,
    TResult? Function(String id)? deleteMeeting,
    TResult? Function()? refreshMeetings,
  }) {
    return loadMeetings?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? loadMeetings,
    TResult Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult Function(String roomCode)? joinMeeting,
    TResult Function(String id)? deleteMeeting,
    TResult Function()? refreshMeetings,
    required TResult orElse(),
  }) {
    if (loadMeetings != null) {
      return loadMeetings(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMeetings value) loadMeetings,
    required TResult Function(CreateMeeting value) createMeeting,
    required TResult Function(JoinMeeting value) joinMeeting,
    required TResult Function(DeleteMeeting value) deleteMeeting,
    required TResult Function(RefreshMeetings value) refreshMeetings,
  }) {
    return loadMeetings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMeetings value)? loadMeetings,
    TResult? Function(CreateMeeting value)? createMeeting,
    TResult? Function(JoinMeeting value)? joinMeeting,
    TResult? Function(DeleteMeeting value)? deleteMeeting,
    TResult? Function(RefreshMeetings value)? refreshMeetings,
  }) {
    return loadMeetings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMeetings value)? loadMeetings,
    TResult Function(CreateMeeting value)? createMeeting,
    TResult Function(JoinMeeting value)? joinMeeting,
    TResult Function(DeleteMeeting value)? deleteMeeting,
    TResult Function(RefreshMeetings value)? refreshMeetings,
    required TResult orElse(),
  }) {
    if (loadMeetings != null) {
      return loadMeetings(this);
    }
    return orElse();
  }
}

abstract class LoadMeetings implements MeetingsEvent {
  const factory LoadMeetings({final String? status}) = _$LoadMeetingsImpl;

  String? get status;
  @JsonKey(ignore: true)
  _$$LoadMeetingsImplCopyWith<_$LoadMeetingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateMeetingImplCopyWith<$Res> {
  factory _$$CreateMeetingImplCopyWith(
          _$CreateMeetingImpl value, $Res Function(_$CreateMeetingImpl) then) =
      __$$CreateMeetingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime scheduledAt,
      int? duration,
      int? maxParticipants,
      bool? requiresApproval});
}

/// @nodoc
class __$$CreateMeetingImplCopyWithImpl<$Res>
    extends _$MeetingsEventCopyWithImpl<$Res, _$CreateMeetingImpl>
    implements _$$CreateMeetingImplCopyWith<$Res> {
  __$$CreateMeetingImplCopyWithImpl(
      _$CreateMeetingImpl _value, $Res Function(_$CreateMeetingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? duration = freezed,
    Object? maxParticipants = freezed,
    Object? requiresApproval = freezed,
  }) {
    return _then(_$CreateMeetingImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      requiresApproval: freezed == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$CreateMeetingImpl implements CreateMeeting {
  const _$CreateMeetingImpl(
      {required this.title,
      required this.description,
      required this.scheduledAt,
      this.duration,
      this.maxParticipants,
      this.requiresApproval});

  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime scheduledAt;
  @override
  final int? duration;
  @override
  final int? maxParticipants;
  @override
  final bool? requiresApproval;

  @override
  String toString() {
    return 'MeetingsEvent.createMeeting(title: $title, description: $description, scheduledAt: $scheduledAt, duration: $duration, maxParticipants: $maxParticipants, requiresApproval: $requiresApproval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateMeetingImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.requiresApproval, requiresApproval) ||
                other.requiresApproval == requiresApproval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, scheduledAt,
      duration, maxParticipants, requiresApproval);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateMeetingImplCopyWith<_$CreateMeetingImpl> get copyWith =>
      __$$CreateMeetingImplCopyWithImpl<_$CreateMeetingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) loadMeetings,
    required TResult Function(
            String title,
            String description,
            DateTime scheduledAt,
            int? duration,
            int? maxParticipants,
            bool? requiresApproval)
        createMeeting,
    required TResult Function(String roomCode) joinMeeting,
    required TResult Function(String id) deleteMeeting,
    required TResult Function() refreshMeetings,
  }) {
    return createMeeting(title, description, scheduledAt, duration,
        maxParticipants, requiresApproval);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? loadMeetings,
    TResult? Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult? Function(String roomCode)? joinMeeting,
    TResult? Function(String id)? deleteMeeting,
    TResult? Function()? refreshMeetings,
  }) {
    return createMeeting?.call(title, description, scheduledAt, duration,
        maxParticipants, requiresApproval);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? loadMeetings,
    TResult Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult Function(String roomCode)? joinMeeting,
    TResult Function(String id)? deleteMeeting,
    TResult Function()? refreshMeetings,
    required TResult orElse(),
  }) {
    if (createMeeting != null) {
      return createMeeting(title, description, scheduledAt, duration,
          maxParticipants, requiresApproval);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMeetings value) loadMeetings,
    required TResult Function(CreateMeeting value) createMeeting,
    required TResult Function(JoinMeeting value) joinMeeting,
    required TResult Function(DeleteMeeting value) deleteMeeting,
    required TResult Function(RefreshMeetings value) refreshMeetings,
  }) {
    return createMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMeetings value)? loadMeetings,
    TResult? Function(CreateMeeting value)? createMeeting,
    TResult? Function(JoinMeeting value)? joinMeeting,
    TResult? Function(DeleteMeeting value)? deleteMeeting,
    TResult? Function(RefreshMeetings value)? refreshMeetings,
  }) {
    return createMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMeetings value)? loadMeetings,
    TResult Function(CreateMeeting value)? createMeeting,
    TResult Function(JoinMeeting value)? joinMeeting,
    TResult Function(DeleteMeeting value)? deleteMeeting,
    TResult Function(RefreshMeetings value)? refreshMeetings,
    required TResult orElse(),
  }) {
    if (createMeeting != null) {
      return createMeeting(this);
    }
    return orElse();
  }
}

abstract class CreateMeeting implements MeetingsEvent {
  const factory CreateMeeting(
      {required final String title,
      required final String description,
      required final DateTime scheduledAt,
      final int? duration,
      final int? maxParticipants,
      final bool? requiresApproval}) = _$CreateMeetingImpl;

  String get title;
  String get description;
  DateTime get scheduledAt;
  int? get duration;
  int? get maxParticipants;
  bool? get requiresApproval;
  @JsonKey(ignore: true)
  _$$CreateMeetingImplCopyWith<_$CreateMeetingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JoinMeetingImplCopyWith<$Res> {
  factory _$$JoinMeetingImplCopyWith(
          _$JoinMeetingImpl value, $Res Function(_$JoinMeetingImpl) then) =
      __$$JoinMeetingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomCode});
}

/// @nodoc
class __$$JoinMeetingImplCopyWithImpl<$Res>
    extends _$MeetingsEventCopyWithImpl<$Res, _$JoinMeetingImpl>
    implements _$$JoinMeetingImplCopyWith<$Res> {
  __$$JoinMeetingImplCopyWithImpl(
      _$JoinMeetingImpl _value, $Res Function(_$JoinMeetingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomCode = null,
  }) {
    return _then(_$JoinMeetingImpl(
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JoinMeetingImpl implements JoinMeeting {
  const _$JoinMeetingImpl({required this.roomCode});

  @override
  final String roomCode;

  @override
  String toString() {
    return 'MeetingsEvent.joinMeeting(roomCode: $roomCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinMeetingImpl &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinMeetingImplCopyWith<_$JoinMeetingImpl> get copyWith =>
      __$$JoinMeetingImplCopyWithImpl<_$JoinMeetingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) loadMeetings,
    required TResult Function(
            String title,
            String description,
            DateTime scheduledAt,
            int? duration,
            int? maxParticipants,
            bool? requiresApproval)
        createMeeting,
    required TResult Function(String roomCode) joinMeeting,
    required TResult Function(String id) deleteMeeting,
    required TResult Function() refreshMeetings,
  }) {
    return joinMeeting(roomCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? loadMeetings,
    TResult? Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult? Function(String roomCode)? joinMeeting,
    TResult? Function(String id)? deleteMeeting,
    TResult? Function()? refreshMeetings,
  }) {
    return joinMeeting?.call(roomCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? loadMeetings,
    TResult Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult Function(String roomCode)? joinMeeting,
    TResult Function(String id)? deleteMeeting,
    TResult Function()? refreshMeetings,
    required TResult orElse(),
  }) {
    if (joinMeeting != null) {
      return joinMeeting(roomCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMeetings value) loadMeetings,
    required TResult Function(CreateMeeting value) createMeeting,
    required TResult Function(JoinMeeting value) joinMeeting,
    required TResult Function(DeleteMeeting value) deleteMeeting,
    required TResult Function(RefreshMeetings value) refreshMeetings,
  }) {
    return joinMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMeetings value)? loadMeetings,
    TResult? Function(CreateMeeting value)? createMeeting,
    TResult? Function(JoinMeeting value)? joinMeeting,
    TResult? Function(DeleteMeeting value)? deleteMeeting,
    TResult? Function(RefreshMeetings value)? refreshMeetings,
  }) {
    return joinMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMeetings value)? loadMeetings,
    TResult Function(CreateMeeting value)? createMeeting,
    TResult Function(JoinMeeting value)? joinMeeting,
    TResult Function(DeleteMeeting value)? deleteMeeting,
    TResult Function(RefreshMeetings value)? refreshMeetings,
    required TResult orElse(),
  }) {
    if (joinMeeting != null) {
      return joinMeeting(this);
    }
    return orElse();
  }
}

abstract class JoinMeeting implements MeetingsEvent {
  const factory JoinMeeting({required final String roomCode}) =
      _$JoinMeetingImpl;

  String get roomCode;
  @JsonKey(ignore: true)
  _$$JoinMeetingImplCopyWith<_$JoinMeetingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMeetingImplCopyWith<$Res> {
  factory _$$DeleteMeetingImplCopyWith(
          _$DeleteMeetingImpl value, $Res Function(_$DeleteMeetingImpl) then) =
      __$$DeleteMeetingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteMeetingImplCopyWithImpl<$Res>
    extends _$MeetingsEventCopyWithImpl<$Res, _$DeleteMeetingImpl>
    implements _$$DeleteMeetingImplCopyWith<$Res> {
  __$$DeleteMeetingImplCopyWithImpl(
      _$DeleteMeetingImpl _value, $Res Function(_$DeleteMeetingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteMeetingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteMeetingImpl implements DeleteMeeting {
  const _$DeleteMeetingImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MeetingsEvent.deleteMeeting(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMeetingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMeetingImplCopyWith<_$DeleteMeetingImpl> get copyWith =>
      __$$DeleteMeetingImplCopyWithImpl<_$DeleteMeetingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) loadMeetings,
    required TResult Function(
            String title,
            String description,
            DateTime scheduledAt,
            int? duration,
            int? maxParticipants,
            bool? requiresApproval)
        createMeeting,
    required TResult Function(String roomCode) joinMeeting,
    required TResult Function(String id) deleteMeeting,
    required TResult Function() refreshMeetings,
  }) {
    return deleteMeeting(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? loadMeetings,
    TResult? Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult? Function(String roomCode)? joinMeeting,
    TResult? Function(String id)? deleteMeeting,
    TResult? Function()? refreshMeetings,
  }) {
    return deleteMeeting?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? loadMeetings,
    TResult Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult Function(String roomCode)? joinMeeting,
    TResult Function(String id)? deleteMeeting,
    TResult Function()? refreshMeetings,
    required TResult orElse(),
  }) {
    if (deleteMeeting != null) {
      return deleteMeeting(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMeetings value) loadMeetings,
    required TResult Function(CreateMeeting value) createMeeting,
    required TResult Function(JoinMeeting value) joinMeeting,
    required TResult Function(DeleteMeeting value) deleteMeeting,
    required TResult Function(RefreshMeetings value) refreshMeetings,
  }) {
    return deleteMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMeetings value)? loadMeetings,
    TResult? Function(CreateMeeting value)? createMeeting,
    TResult? Function(JoinMeeting value)? joinMeeting,
    TResult? Function(DeleteMeeting value)? deleteMeeting,
    TResult? Function(RefreshMeetings value)? refreshMeetings,
  }) {
    return deleteMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMeetings value)? loadMeetings,
    TResult Function(CreateMeeting value)? createMeeting,
    TResult Function(JoinMeeting value)? joinMeeting,
    TResult Function(DeleteMeeting value)? deleteMeeting,
    TResult Function(RefreshMeetings value)? refreshMeetings,
    required TResult orElse(),
  }) {
    if (deleteMeeting != null) {
      return deleteMeeting(this);
    }
    return orElse();
  }
}

abstract class DeleteMeeting implements MeetingsEvent {
  const factory DeleteMeeting({required final String id}) = _$DeleteMeetingImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteMeetingImplCopyWith<_$DeleteMeetingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshMeetingsImplCopyWith<$Res> {
  factory _$$RefreshMeetingsImplCopyWith(_$RefreshMeetingsImpl value,
          $Res Function(_$RefreshMeetingsImpl) then) =
      __$$RefreshMeetingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshMeetingsImplCopyWithImpl<$Res>
    extends _$MeetingsEventCopyWithImpl<$Res, _$RefreshMeetingsImpl>
    implements _$$RefreshMeetingsImplCopyWith<$Res> {
  __$$RefreshMeetingsImplCopyWithImpl(
      _$RefreshMeetingsImpl _value, $Res Function(_$RefreshMeetingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshMeetingsImpl implements RefreshMeetings {
  const _$RefreshMeetingsImpl();

  @override
  String toString() {
    return 'MeetingsEvent.refreshMeetings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshMeetingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) loadMeetings,
    required TResult Function(
            String title,
            String description,
            DateTime scheduledAt,
            int? duration,
            int? maxParticipants,
            bool? requiresApproval)
        createMeeting,
    required TResult Function(String roomCode) joinMeeting,
    required TResult Function(String id) deleteMeeting,
    required TResult Function() refreshMeetings,
  }) {
    return refreshMeetings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? loadMeetings,
    TResult? Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult? Function(String roomCode)? joinMeeting,
    TResult? Function(String id)? deleteMeeting,
    TResult? Function()? refreshMeetings,
  }) {
    return refreshMeetings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? loadMeetings,
    TResult Function(String title, String description, DateTime scheduledAt,
            int? duration, int? maxParticipants, bool? requiresApproval)?
        createMeeting,
    TResult Function(String roomCode)? joinMeeting,
    TResult Function(String id)? deleteMeeting,
    TResult Function()? refreshMeetings,
    required TResult orElse(),
  }) {
    if (refreshMeetings != null) {
      return refreshMeetings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMeetings value) loadMeetings,
    required TResult Function(CreateMeeting value) createMeeting,
    required TResult Function(JoinMeeting value) joinMeeting,
    required TResult Function(DeleteMeeting value) deleteMeeting,
    required TResult Function(RefreshMeetings value) refreshMeetings,
  }) {
    return refreshMeetings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMeetings value)? loadMeetings,
    TResult? Function(CreateMeeting value)? createMeeting,
    TResult? Function(JoinMeeting value)? joinMeeting,
    TResult? Function(DeleteMeeting value)? deleteMeeting,
    TResult? Function(RefreshMeetings value)? refreshMeetings,
  }) {
    return refreshMeetings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMeetings value)? loadMeetings,
    TResult Function(CreateMeeting value)? createMeeting,
    TResult Function(JoinMeeting value)? joinMeeting,
    TResult Function(DeleteMeeting value)? deleteMeeting,
    TResult Function(RefreshMeetings value)? refreshMeetings,
    required TResult orElse(),
  }) {
    if (refreshMeetings != null) {
      return refreshMeetings(this);
    }
    return orElse();
  }
}

abstract class RefreshMeetings implements MeetingsEvent {
  const factory RefreshMeetings() = _$RefreshMeetingsImpl;
}
