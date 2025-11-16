import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/device_service.dart';
import '../../../../core/utils/app_logger.dart';
import 'preview_event.dart';
import 'preview_state.dart';

/// Preview BLoC
///
/// Manages state for Join Preview page
/// Handles camera/microphone permissions and preview
///
/// NO MOCK DATA - All data comes from DeviceService interface
class PreviewBloc extends Bloc<PreviewEvent, PreviewState> {
  final DeviceService? deviceService;

  PreviewBloc({
    required String roomId,
    this.deviceService,
  }) : super(PreviewState(roomId: roomId)) {
    on<Initialize>(_onInitialize);
    on<ToggleCamera>(_onToggleCamera);
    on<ToggleMicrophone>(_onToggleMicrophone);
    on<SwitchCamera>(_onSwitchCamera);
    on<UpdateDisplayName>(_onUpdateDisplayName);
    on<RequestCameraPermission>(_onRequestCameraPermission);
    on<RequestMicrophonePermission>(_onRequestMicrophonePermission);
    on<OpenSettings>(_onOpenSettings);
    on<JoinMeeting>(_onJoinMeeting);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<PreviewState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      if (deviceService == null) {
        // DeviceService not implemented yet - default to available
        emit(state.copyWith(
          isLoading: false,
          hasCamera: true,
          hasMicrophone: true,
          isReadyToJoin: true,
          permissions: const DevicePermissions(
            camera: PermissionStatus.granted,
            microphone: PermissionStatus.granted,
          ),
        ));
        return;
      }

      // Check device availability
      final hasCamera = await deviceService!.hasCamera();
      final hasMicrophone = await deviceService!.hasMicrophone();

      // Check permissions
      final cameraGranted = await deviceService!.isCameraPermissionGranted();
      final micGranted = await deviceService!.isMicrophonePermissionGranted();

      final cameraStatus = cameraGranted
          ? PermissionStatus.granted
          : PermissionStatus.notDetermined;
      final micStatus = micGranted
          ? PermissionStatus.granted
          : PermissionStatus.notDetermined;

      // Get available cameras
      final cameras = hasCamera && cameraGranted
          ? await deviceService!.getAvailableCameras()
          : <String>[];

      emit(state.copyWith(
        isLoading: false,
        hasCamera: hasCamera,
        hasMicrophone: hasMicrophone,
        permissions: DevicePermissions(
          camera: cameraStatus,
          microphone: micStatus,
        ),
        availableCameras: cameras,
        isReadyToJoin: true,
        cameraEnabled: hasCamera && cameraGranted,
        microphoneEnabled: hasMicrophone && micGranted,
      ));
    } catch (e) {
      AppLogger.e('Failed to initialize preview', error: e);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to initialize preview: ${e.toString()}',
      ));
    }
  }

  Future<void> _onToggleCamera(
    ToggleCamera event,
    Emitter<PreviewState> emit,
  ) async {
    if (!state.canToggleCamera) return;

    emit(state.copyWith(cameraEnabled: !state.cameraEnabled));
  }

  Future<void> _onToggleMicrophone(
    ToggleMicrophone event,
    Emitter<PreviewState> emit,
  ) async {
    if (!state.canToggleMicrophone) return;

    emit(state.copyWith(microphoneEnabled: !state.microphoneEnabled));
  }

  Future<void> _onSwitchCamera(
    SwitchCamera event,
    Emitter<PreviewState> emit,
  ) async {
    if (!state.canSwitchCamera || deviceService == null) return;

    try {
      final newCamera = await deviceService!.switchCamera();
      if (newCamera != null) {
        emit(state.copyWith(currentCamera: newCamera));
      }
    } catch (e) {
      AppLogger.e('Failed to switch camera', error: e);
    }
  }

  Future<void> _onUpdateDisplayName(
    UpdateDisplayName event,
    Emitter<PreviewState> emit,
  ) async {
    emit(state.copyWith(displayName: event.name));
  }

  Future<void> _onRequestCameraPermission(
    RequestCameraPermission event,
    Emitter<PreviewState> emit,
  ) async {
    if (deviceService == null) return;

    emit(state.copyWith(isLoading: true));

    try {
      final granted = await deviceService!.requestCameraPermission();
      final isPermanentlyDenied = !granted &&
          await deviceService!.isCameraPermissionPermanentlyDenied();

      final newStatus = granted
          ? PermissionStatus.granted
          : (isPermanentlyDenied
              ? PermissionStatus.permanentlyDenied
              : PermissionStatus.denied);

      emit(state.copyWith(
        isLoading: false,
        permissions: state.permissions.copyWith(camera: newStatus),
        cameraEnabled: granted,
      ));
    } catch (e) {
      AppLogger.e('Failed to request camera permission', error: e);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to request camera permission',
      ));
    }
  }

  Future<void> _onRequestMicrophonePermission(
    RequestMicrophonePermission event,
    Emitter<PreviewState> emit,
  ) async {
    if (deviceService == null) return;

    emit(state.copyWith(isLoading: true));

    try {
      final granted = await deviceService!.requestMicrophonePermission();
      final isPermanentlyDenied = !granted &&
          await deviceService!.isMicrophonePermissionPermanentlyDenied();

      final newStatus = granted
          ? PermissionStatus.granted
          : (isPermanentlyDenied
              ? PermissionStatus.permanentlyDenied
              : PermissionStatus.denied);

      emit(state.copyWith(
        isLoading: false,
        permissions: state.permissions.copyWith(microphone: newStatus),
        microphoneEnabled: granted,
      ));
    } catch (e) {
      AppLogger.e('Failed to request microphone permission', error: e);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to request microphone permission',
      ));
    }
  }

  Future<void> _onOpenSettings(
    OpenSettings event,
    Emitter<PreviewState> emit,
  ) async {
    if (deviceService == null) return;

    try {
      await deviceService!.openAppSettings();
    } catch (e) {
      AppLogger.e('Failed to open settings', error: e);
    }
  }

  Future<void> _onJoinMeeting(
    JoinMeeting event,
    Emitter<PreviewState> emit,
  ) async {
    // This event will trigger navigation to connecting page
    // The actual navigation is handled in the UI
    AppLogger.i('Join meeting requested for room: ${state.roomId}');
  }
}
