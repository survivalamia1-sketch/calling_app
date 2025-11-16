// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_meetings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduledMeetingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScheduledMeetingStatus? status)
        loadScheduledMeetings,
    required TResult Function() refreshScheduledMeetings,
    required TResult Function(String id) deleteScheduledMeeting,
    required TResult Function(String id) startScheduledMeeting,
    required TResult Function(ScheduledMeetingStatus? status) filterByStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult? Function()? refreshScheduledMeetings,
    TResult? Function(String id)? deleteScheduledMeeting,
    TResult? Function(String id)? startScheduledMeeting,
    TResult? Function(ScheduledMeetingStatus? status)? filterByStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult Function()? refreshScheduledMeetings,
    TResult Function(String id)? deleteScheduledMeeting,
    TResult Function(String id)? startScheduledMeeting,
    TResult Function(ScheduledMeetingStatus? status)? filterByStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadScheduledMeetings value)
        loadScheduledMeetings,
    required TResult Function(RefreshScheduledMeetings value)
        refreshScheduledMeetings,
    required TResult Function(DeleteScheduledMeeting value)
        deleteScheduledMeeting,
    required TResult Function(StartScheduledMeeting value)
        startScheduledMeeting,
    required TResult Function(FilterByStatus value) filterByStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult? Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult? Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult? Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult? Function(FilterByStatus value)? filterByStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult Function(FilterByStatus value)? filterByStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledMeetingsEventCopyWith<$Res> {
  factory $ScheduledMeetingsEventCopyWith(ScheduledMeetingsEvent value,
          $Res Function(ScheduledMeetingsEvent) then) =
      _$ScheduledMeetingsEventCopyWithImpl<$Res, ScheduledMeetingsEvent>;
}

/// @nodoc
class _$ScheduledMeetingsEventCopyWithImpl<$Res,
        $Val extends ScheduledMeetingsEvent>
    implements $ScheduledMeetingsEventCopyWith<$Res> {
  _$ScheduledMeetingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadScheduledMeetingsImplCopyWith<$Res> {
  factory _$$LoadScheduledMeetingsImplCopyWith(
          _$LoadScheduledMeetingsImpl value,
          $Res Function(_$LoadScheduledMeetingsImpl) then) =
      __$$LoadScheduledMeetingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScheduledMeetingStatus? status});
}

/// @nodoc
class __$$LoadScheduledMeetingsImplCopyWithImpl<$Res>
    extends _$ScheduledMeetingsEventCopyWithImpl<$Res,
        _$LoadScheduledMeetingsImpl>
    implements _$$LoadScheduledMeetingsImplCopyWith<$Res> {
  __$$LoadScheduledMeetingsImplCopyWithImpl(_$LoadScheduledMeetingsImpl _value,
      $Res Function(_$LoadScheduledMeetingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$LoadScheduledMeetingsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScheduledMeetingStatus?,
    ));
  }
}

/// @nodoc

class _$LoadScheduledMeetingsImpl implements LoadScheduledMeetings {
  const _$LoadScheduledMeetingsImpl({this.status});

  @override
  final ScheduledMeetingStatus? status;

  @override
  String toString() {
    return 'ScheduledMeetingsEvent.loadScheduledMeetings(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadScheduledMeetingsImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadScheduledMeetingsImplCopyWith<_$LoadScheduledMeetingsImpl>
      get copyWith => __$$LoadScheduledMeetingsImplCopyWithImpl<
          _$LoadScheduledMeetingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScheduledMeetingStatus? status)
        loadScheduledMeetings,
    required TResult Function() refreshScheduledMeetings,
    required TResult Function(String id) deleteScheduledMeeting,
    required TResult Function(String id) startScheduledMeeting,
    required TResult Function(ScheduledMeetingStatus? status) filterByStatus,
  }) {
    return loadScheduledMeetings(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult? Function()? refreshScheduledMeetings,
    TResult? Function(String id)? deleteScheduledMeeting,
    TResult? Function(String id)? startScheduledMeeting,
    TResult? Function(ScheduledMeetingStatus? status)? filterByStatus,
  }) {
    return loadScheduledMeetings?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult Function()? refreshScheduledMeetings,
    TResult Function(String id)? deleteScheduledMeeting,
    TResult Function(String id)? startScheduledMeeting,
    TResult Function(ScheduledMeetingStatus? status)? filterByStatus,
    required TResult orElse(),
  }) {
    if (loadScheduledMeetings != null) {
      return loadScheduledMeetings(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadScheduledMeetings value)
        loadScheduledMeetings,
    required TResult Function(RefreshScheduledMeetings value)
        refreshScheduledMeetings,
    required TResult Function(DeleteScheduledMeeting value)
        deleteScheduledMeeting,
    required TResult Function(StartScheduledMeeting value)
        startScheduledMeeting,
    required TResult Function(FilterByStatus value) filterByStatus,
  }) {
    return loadScheduledMeetings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult? Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult? Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult? Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult? Function(FilterByStatus value)? filterByStatus,
  }) {
    return loadScheduledMeetings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult Function(FilterByStatus value)? filterByStatus,
    required TResult orElse(),
  }) {
    if (loadScheduledMeetings != null) {
      return loadScheduledMeetings(this);
    }
    return orElse();
  }
}

abstract class LoadScheduledMeetings implements ScheduledMeetingsEvent {
  const factory LoadScheduledMeetings({final ScheduledMeetingStatus? status}) =
      _$LoadScheduledMeetingsImpl;

  ScheduledMeetingStatus? get status;
  @JsonKey(ignore: true)
  _$$LoadScheduledMeetingsImplCopyWith<_$LoadScheduledMeetingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshScheduledMeetingsImplCopyWith<$Res> {
  factory _$$RefreshScheduledMeetingsImplCopyWith(
          _$RefreshScheduledMeetingsImpl value,
          $Res Function(_$RefreshScheduledMeetingsImpl) then) =
      __$$RefreshScheduledMeetingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshScheduledMeetingsImplCopyWithImpl<$Res>
    extends _$ScheduledMeetingsEventCopyWithImpl<$Res,
        _$RefreshScheduledMeetingsImpl>
    implements _$$RefreshScheduledMeetingsImplCopyWith<$Res> {
  __$$RefreshScheduledMeetingsImplCopyWithImpl(
      _$RefreshScheduledMeetingsImpl _value,
      $Res Function(_$RefreshScheduledMeetingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshScheduledMeetingsImpl implements RefreshScheduledMeetings {
  const _$RefreshScheduledMeetingsImpl();

  @override
  String toString() {
    return 'ScheduledMeetingsEvent.refreshScheduledMeetings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshScheduledMeetingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScheduledMeetingStatus? status)
        loadScheduledMeetings,
    required TResult Function() refreshScheduledMeetings,
    required TResult Function(String id) deleteScheduledMeeting,
    required TResult Function(String id) startScheduledMeeting,
    required TResult Function(ScheduledMeetingStatus? status) filterByStatus,
  }) {
    return refreshScheduledMeetings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult? Function()? refreshScheduledMeetings,
    TResult? Function(String id)? deleteScheduledMeeting,
    TResult? Function(String id)? startScheduledMeeting,
    TResult? Function(ScheduledMeetingStatus? status)? filterByStatus,
  }) {
    return refreshScheduledMeetings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult Function()? refreshScheduledMeetings,
    TResult Function(String id)? deleteScheduledMeeting,
    TResult Function(String id)? startScheduledMeeting,
    TResult Function(ScheduledMeetingStatus? status)? filterByStatus,
    required TResult orElse(),
  }) {
    if (refreshScheduledMeetings != null) {
      return refreshScheduledMeetings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadScheduledMeetings value)
        loadScheduledMeetings,
    required TResult Function(RefreshScheduledMeetings value)
        refreshScheduledMeetings,
    required TResult Function(DeleteScheduledMeeting value)
        deleteScheduledMeeting,
    required TResult Function(StartScheduledMeeting value)
        startScheduledMeeting,
    required TResult Function(FilterByStatus value) filterByStatus,
  }) {
    return refreshScheduledMeetings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult? Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult? Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult? Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult? Function(FilterByStatus value)? filterByStatus,
  }) {
    return refreshScheduledMeetings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult Function(FilterByStatus value)? filterByStatus,
    required TResult orElse(),
  }) {
    if (refreshScheduledMeetings != null) {
      return refreshScheduledMeetings(this);
    }
    return orElse();
  }
}

abstract class RefreshScheduledMeetings implements ScheduledMeetingsEvent {
  const factory RefreshScheduledMeetings() = _$RefreshScheduledMeetingsImpl;
}

/// @nodoc
abstract class _$$DeleteScheduledMeetingImplCopyWith<$Res> {
  factory _$$DeleteScheduledMeetingImplCopyWith(
          _$DeleteScheduledMeetingImpl value,
          $Res Function(_$DeleteScheduledMeetingImpl) then) =
      __$$DeleteScheduledMeetingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteScheduledMeetingImplCopyWithImpl<$Res>
    extends _$ScheduledMeetingsEventCopyWithImpl<$Res,
        _$DeleteScheduledMeetingImpl>
    implements _$$DeleteScheduledMeetingImplCopyWith<$Res> {
  __$$DeleteScheduledMeetingImplCopyWithImpl(
      _$DeleteScheduledMeetingImpl _value,
      $Res Function(_$DeleteScheduledMeetingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteScheduledMeetingImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteScheduledMeetingImpl implements DeleteScheduledMeeting {
  const _$DeleteScheduledMeetingImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ScheduledMeetingsEvent.deleteScheduledMeeting(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteScheduledMeetingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteScheduledMeetingImplCopyWith<_$DeleteScheduledMeetingImpl>
      get copyWith => __$$DeleteScheduledMeetingImplCopyWithImpl<
          _$DeleteScheduledMeetingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScheduledMeetingStatus? status)
        loadScheduledMeetings,
    required TResult Function() refreshScheduledMeetings,
    required TResult Function(String id) deleteScheduledMeeting,
    required TResult Function(String id) startScheduledMeeting,
    required TResult Function(ScheduledMeetingStatus? status) filterByStatus,
  }) {
    return deleteScheduledMeeting(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult? Function()? refreshScheduledMeetings,
    TResult? Function(String id)? deleteScheduledMeeting,
    TResult? Function(String id)? startScheduledMeeting,
    TResult? Function(ScheduledMeetingStatus? status)? filterByStatus,
  }) {
    return deleteScheduledMeeting?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult Function()? refreshScheduledMeetings,
    TResult Function(String id)? deleteScheduledMeeting,
    TResult Function(String id)? startScheduledMeeting,
    TResult Function(ScheduledMeetingStatus? status)? filterByStatus,
    required TResult orElse(),
  }) {
    if (deleteScheduledMeeting != null) {
      return deleteScheduledMeeting(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadScheduledMeetings value)
        loadScheduledMeetings,
    required TResult Function(RefreshScheduledMeetings value)
        refreshScheduledMeetings,
    required TResult Function(DeleteScheduledMeeting value)
        deleteScheduledMeeting,
    required TResult Function(StartScheduledMeeting value)
        startScheduledMeeting,
    required TResult Function(FilterByStatus value) filterByStatus,
  }) {
    return deleteScheduledMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult? Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult? Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult? Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult? Function(FilterByStatus value)? filterByStatus,
  }) {
    return deleteScheduledMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult Function(FilterByStatus value)? filterByStatus,
    required TResult orElse(),
  }) {
    if (deleteScheduledMeeting != null) {
      return deleteScheduledMeeting(this);
    }
    return orElse();
  }
}

abstract class DeleteScheduledMeeting implements ScheduledMeetingsEvent {
  const factory DeleteScheduledMeeting(final String id) =
      _$DeleteScheduledMeetingImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteScheduledMeetingImplCopyWith<_$DeleteScheduledMeetingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartScheduledMeetingImplCopyWith<$Res> {
  factory _$$StartScheduledMeetingImplCopyWith(
          _$StartScheduledMeetingImpl value,
          $Res Function(_$StartScheduledMeetingImpl) then) =
      __$$StartScheduledMeetingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$StartScheduledMeetingImplCopyWithImpl<$Res>
    extends _$ScheduledMeetingsEventCopyWithImpl<$Res,
        _$StartScheduledMeetingImpl>
    implements _$$StartScheduledMeetingImplCopyWith<$Res> {
  __$$StartScheduledMeetingImplCopyWithImpl(_$StartScheduledMeetingImpl _value,
      $Res Function(_$StartScheduledMeetingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$StartScheduledMeetingImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartScheduledMeetingImpl implements StartScheduledMeeting {
  const _$StartScheduledMeetingImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ScheduledMeetingsEvent.startScheduledMeeting(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartScheduledMeetingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartScheduledMeetingImplCopyWith<_$StartScheduledMeetingImpl>
      get copyWith => __$$StartScheduledMeetingImplCopyWithImpl<
          _$StartScheduledMeetingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScheduledMeetingStatus? status)
        loadScheduledMeetings,
    required TResult Function() refreshScheduledMeetings,
    required TResult Function(String id) deleteScheduledMeeting,
    required TResult Function(String id) startScheduledMeeting,
    required TResult Function(ScheduledMeetingStatus? status) filterByStatus,
  }) {
    return startScheduledMeeting(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult? Function()? refreshScheduledMeetings,
    TResult? Function(String id)? deleteScheduledMeeting,
    TResult? Function(String id)? startScheduledMeeting,
    TResult? Function(ScheduledMeetingStatus? status)? filterByStatus,
  }) {
    return startScheduledMeeting?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult Function()? refreshScheduledMeetings,
    TResult Function(String id)? deleteScheduledMeeting,
    TResult Function(String id)? startScheduledMeeting,
    TResult Function(ScheduledMeetingStatus? status)? filterByStatus,
    required TResult orElse(),
  }) {
    if (startScheduledMeeting != null) {
      return startScheduledMeeting(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadScheduledMeetings value)
        loadScheduledMeetings,
    required TResult Function(RefreshScheduledMeetings value)
        refreshScheduledMeetings,
    required TResult Function(DeleteScheduledMeeting value)
        deleteScheduledMeeting,
    required TResult Function(StartScheduledMeeting value)
        startScheduledMeeting,
    required TResult Function(FilterByStatus value) filterByStatus,
  }) {
    return startScheduledMeeting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult? Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult? Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult? Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult? Function(FilterByStatus value)? filterByStatus,
  }) {
    return startScheduledMeeting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult Function(FilterByStatus value)? filterByStatus,
    required TResult orElse(),
  }) {
    if (startScheduledMeeting != null) {
      return startScheduledMeeting(this);
    }
    return orElse();
  }
}

abstract class StartScheduledMeeting implements ScheduledMeetingsEvent {
  const factory StartScheduledMeeting(final String id) =
      _$StartScheduledMeetingImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$StartScheduledMeetingImplCopyWith<_$StartScheduledMeetingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByStatusImplCopyWith<$Res> {
  factory _$$FilterByStatusImplCopyWith(_$FilterByStatusImpl value,
          $Res Function(_$FilterByStatusImpl) then) =
      __$$FilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScheduledMeetingStatus? status});
}

/// @nodoc
class __$$FilterByStatusImplCopyWithImpl<$Res>
    extends _$ScheduledMeetingsEventCopyWithImpl<$Res, _$FilterByStatusImpl>
    implements _$$FilterByStatusImplCopyWith<$Res> {
  __$$FilterByStatusImplCopyWithImpl(
      _$FilterByStatusImpl _value, $Res Function(_$FilterByStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FilterByStatusImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScheduledMeetingStatus?,
    ));
  }
}

/// @nodoc

class _$FilterByStatusImpl implements FilterByStatus {
  const _$FilterByStatusImpl(this.status);

  @override
  final ScheduledMeetingStatus? status;

  @override
  String toString() {
    return 'ScheduledMeetingsEvent.filterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      __$$FilterByStatusImplCopyWithImpl<_$FilterByStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScheduledMeetingStatus? status)
        loadScheduledMeetings,
    required TResult Function() refreshScheduledMeetings,
    required TResult Function(String id) deleteScheduledMeeting,
    required TResult Function(String id) startScheduledMeeting,
    required TResult Function(ScheduledMeetingStatus? status) filterByStatus,
  }) {
    return filterByStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult? Function()? refreshScheduledMeetings,
    TResult? Function(String id)? deleteScheduledMeeting,
    TResult? Function(String id)? startScheduledMeeting,
    TResult? Function(ScheduledMeetingStatus? status)? filterByStatus,
  }) {
    return filterByStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScheduledMeetingStatus? status)? loadScheduledMeetings,
    TResult Function()? refreshScheduledMeetings,
    TResult Function(String id)? deleteScheduledMeeting,
    TResult Function(String id)? startScheduledMeeting,
    TResult Function(ScheduledMeetingStatus? status)? filterByStatus,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadScheduledMeetings value)
        loadScheduledMeetings,
    required TResult Function(RefreshScheduledMeetings value)
        refreshScheduledMeetings,
    required TResult Function(DeleteScheduledMeeting value)
        deleteScheduledMeeting,
    required TResult Function(StartScheduledMeeting value)
        startScheduledMeeting,
    required TResult Function(FilterByStatus value) filterByStatus,
  }) {
    return filterByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult? Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult? Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult? Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult? Function(FilterByStatus value)? filterByStatus,
  }) {
    return filterByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadScheduledMeetings value)? loadScheduledMeetings,
    TResult Function(RefreshScheduledMeetings value)? refreshScheduledMeetings,
    TResult Function(DeleteScheduledMeeting value)? deleteScheduledMeeting,
    TResult Function(StartScheduledMeeting value)? startScheduledMeeting,
    TResult Function(FilterByStatus value)? filterByStatus,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(this);
    }
    return orElse();
  }
}

abstract class FilterByStatus implements ScheduledMeetingsEvent {
  const factory FilterByStatus(final ScheduledMeetingStatus? status) =
      _$FilterByStatusImpl;

  ScheduledMeetingStatus? get status;
  @JsonKey(ignore: true)
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
