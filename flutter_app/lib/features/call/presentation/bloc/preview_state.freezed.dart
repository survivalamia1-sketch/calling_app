// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreviewState {
  /// Current room ID
  String get roomId => throw _privateConstructorUsedError;

  /// Is camera enabled
  bool get cameraEnabled => throw _privateConstructorUsedError;

  /// Is microphone enabled
  bool get microphoneEnabled => throw _privateConstructorUsedError;

  /// Current camera (front/back)
  String get currentCamera => throw _privateConstructorUsedError;

  /// Display name for user
  String? get displayName => throw _privateConstructorUsedError;

  /// Device permissions status
  DevicePermissions get permissions => throw _privateConstructorUsedError;

  /// Available cameras
  List<String> get availableCameras => throw _privateConstructorUsedError;

  /// Has camera device
  bool get hasCamera => throw _privateConstructorUsedError;

  /// Has microphone device
  bool get hasMicrophone => throw _privateConstructorUsedError;

  /// Is loading/processing
  bool get isLoading => throw _privateConstructorUsedError;

  /// Error message
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Is ready to join
  bool get isReadyToJoin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreviewStateCopyWith<PreviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewStateCopyWith<$Res> {
  factory $PreviewStateCopyWith(
          PreviewState value, $Res Function(PreviewState) then) =
      _$PreviewStateCopyWithImpl<$Res, PreviewState>;
  @useResult
  $Res call(
      {String roomId,
      bool cameraEnabled,
      bool microphoneEnabled,
      String currentCamera,
      String? displayName,
      DevicePermissions permissions,
      List<String> availableCameras,
      bool hasCamera,
      bool hasMicrophone,
      bool isLoading,
      String? errorMessage,
      bool isReadyToJoin});
}

/// @nodoc
class _$PreviewStateCopyWithImpl<$Res, $Val extends PreviewState>
    implements $PreviewStateCopyWith<$Res> {
  _$PreviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? cameraEnabled = null,
    Object? microphoneEnabled = null,
    Object? currentCamera = null,
    Object? displayName = freezed,
    Object? permissions = null,
    Object? availableCameras = null,
    Object? hasCamera = null,
    Object? hasMicrophone = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isReadyToJoin = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      cameraEnabled: null == cameraEnabled
          ? _value.cameraEnabled
          : cameraEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      microphoneEnabled: null == microphoneEnabled
          ? _value.microphoneEnabled
          : microphoneEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCamera: null == currentCamera
          ? _value.currentCamera
          : currentCamera // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as DevicePermissions,
      availableCameras: null == availableCameras
          ? _value.availableCameras
          : availableCameras // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasCamera: null == hasCamera
          ? _value.hasCamera
          : hasCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMicrophone: null == hasMicrophone
          ? _value.hasMicrophone
          : hasMicrophone // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isReadyToJoin: null == isReadyToJoin
          ? _value.isReadyToJoin
          : isReadyToJoin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewStateImplCopyWith<$Res>
    implements $PreviewStateCopyWith<$Res> {
  factory _$$PreviewStateImplCopyWith(
          _$PreviewStateImpl value, $Res Function(_$PreviewStateImpl) then) =
      __$$PreviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      bool cameraEnabled,
      bool microphoneEnabled,
      String currentCamera,
      String? displayName,
      DevicePermissions permissions,
      List<String> availableCameras,
      bool hasCamera,
      bool hasMicrophone,
      bool isLoading,
      String? errorMessage,
      bool isReadyToJoin});
}

/// @nodoc
class __$$PreviewStateImplCopyWithImpl<$Res>
    extends _$PreviewStateCopyWithImpl<$Res, _$PreviewStateImpl>
    implements _$$PreviewStateImplCopyWith<$Res> {
  __$$PreviewStateImplCopyWithImpl(
      _$PreviewStateImpl _value, $Res Function(_$PreviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? cameraEnabled = null,
    Object? microphoneEnabled = null,
    Object? currentCamera = null,
    Object? displayName = freezed,
    Object? permissions = null,
    Object? availableCameras = null,
    Object? hasCamera = null,
    Object? hasMicrophone = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isReadyToJoin = null,
  }) {
    return _then(_$PreviewStateImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      cameraEnabled: null == cameraEnabled
          ? _value.cameraEnabled
          : cameraEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      microphoneEnabled: null == microphoneEnabled
          ? _value.microphoneEnabled
          : microphoneEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCamera: null == currentCamera
          ? _value.currentCamera
          : currentCamera // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as DevicePermissions,
      availableCameras: null == availableCameras
          ? _value._availableCameras
          : availableCameras // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasCamera: null == hasCamera
          ? _value.hasCamera
          : hasCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMicrophone: null == hasMicrophone
          ? _value.hasMicrophone
          : hasMicrophone // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isReadyToJoin: null == isReadyToJoin
          ? _value.isReadyToJoin
          : isReadyToJoin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PreviewStateImpl extends _PreviewState {
  const _$PreviewStateImpl(
      {required this.roomId,
      this.cameraEnabled = true,
      this.microphoneEnabled = true,
      this.currentCamera = 'front',
      this.displayName,
      this.permissions = const DevicePermissions(
          camera: PermissionStatus.notDetermined,
          microphone: PermissionStatus.notDetermined),
      final List<String> availableCameras = const [],
      this.hasCamera = true,
      this.hasMicrophone = true,
      this.isLoading = false,
      this.errorMessage,
      this.isReadyToJoin = false})
      : _availableCameras = availableCameras,
        super._();

  /// Current room ID
  @override
  final String roomId;

  /// Is camera enabled
  @override
  @JsonKey()
  final bool cameraEnabled;

  /// Is microphone enabled
  @override
  @JsonKey()
  final bool microphoneEnabled;

  /// Current camera (front/back)
  @override
  @JsonKey()
  final String currentCamera;

  /// Display name for user
  @override
  final String? displayName;

  /// Device permissions status
  @override
  @JsonKey()
  final DevicePermissions permissions;

  /// Available cameras
  final List<String> _availableCameras;

  /// Available cameras
  @override
  @JsonKey()
  List<String> get availableCameras {
    if (_availableCameras is EqualUnmodifiableListView)
      return _availableCameras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCameras);
  }

  /// Has camera device
  @override
  @JsonKey()
  final bool hasCamera;

  /// Has microphone device
  @override
  @JsonKey()
  final bool hasMicrophone;

  /// Is loading/processing
  @override
  @JsonKey()
  final bool isLoading;

  /// Error message
  @override
  final String? errorMessage;

  /// Is ready to join
  @override
  @JsonKey()
  final bool isReadyToJoin;

  @override
  String toString() {
    return 'PreviewState(roomId: $roomId, cameraEnabled: $cameraEnabled, microphoneEnabled: $microphoneEnabled, currentCamera: $currentCamera, displayName: $displayName, permissions: $permissions, availableCameras: $availableCameras, hasCamera: $hasCamera, hasMicrophone: $hasMicrophone, isLoading: $isLoading, errorMessage: $errorMessage, isReadyToJoin: $isReadyToJoin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewStateImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.cameraEnabled, cameraEnabled) ||
                other.cameraEnabled == cameraEnabled) &&
            (identical(other.microphoneEnabled, microphoneEnabled) ||
                other.microphoneEnabled == microphoneEnabled) &&
            (identical(other.currentCamera, currentCamera) ||
                other.currentCamera == currentCamera) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            const DeepCollectionEquality()
                .equals(other._availableCameras, _availableCameras) &&
            (identical(other.hasCamera, hasCamera) ||
                other.hasCamera == hasCamera) &&
            (identical(other.hasMicrophone, hasMicrophone) ||
                other.hasMicrophone == hasMicrophone) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isReadyToJoin, isReadyToJoin) ||
                other.isReadyToJoin == isReadyToJoin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      cameraEnabled,
      microphoneEnabled,
      currentCamera,
      displayName,
      permissions,
      const DeepCollectionEquality().hash(_availableCameras),
      hasCamera,
      hasMicrophone,
      isLoading,
      errorMessage,
      isReadyToJoin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewStateImplCopyWith<_$PreviewStateImpl> get copyWith =>
      __$$PreviewStateImplCopyWithImpl<_$PreviewStateImpl>(this, _$identity);
}

abstract class _PreviewState extends PreviewState {
  const factory _PreviewState(
      {required final String roomId,
      final bool cameraEnabled,
      final bool microphoneEnabled,
      final String currentCamera,
      final String? displayName,
      final DevicePermissions permissions,
      final List<String> availableCameras,
      final bool hasCamera,
      final bool hasMicrophone,
      final bool isLoading,
      final String? errorMessage,
      final bool isReadyToJoin}) = _$PreviewStateImpl;
  const _PreviewState._() : super._();

  @override

  /// Current room ID
  String get roomId;
  @override

  /// Is camera enabled
  bool get cameraEnabled;
  @override

  /// Is microphone enabled
  bool get microphoneEnabled;
  @override

  /// Current camera (front/back)
  String get currentCamera;
  @override

  /// Display name for user
  String? get displayName;
  @override

  /// Device permissions status
  DevicePermissions get permissions;
  @override

  /// Available cameras
  List<String> get availableCameras;
  @override

  /// Has camera device
  bool get hasCamera;
  @override

  /// Has microphone device
  bool get hasMicrophone;
  @override

  /// Is loading/processing
  bool get isLoading;
  @override

  /// Error message
  String? get errorMessage;
  @override

  /// Is ready to join
  bool get isReadyToJoin;
  @override
  @JsonKey(ignore: true)
  _$$PreviewStateImplCopyWith<_$PreviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
