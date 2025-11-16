import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../domain/repositories/meeting_media_service.dart';
import 'webrtc_service.dart';

/// Real implementation of MeetingMediaService using WebRTC
class MeetingMediaServiceImpl implements MeetingMediaService {
  final WebRTCService _webrtcService;

  MeetingMediaServiceImpl({required WebRTCService webrtcService})
      : _webrtcService = webrtcService;

  @override
  Future<void> muteAudio() async {
    await _webrtcService.toggleAudio(false);
  }

  @override
  Future<void> unmuteAudio() async {
    await _webrtcService.toggleAudio(true);
  }

  @override
  Future<void> startVideo() async {
    await _webrtcService.toggleVideo(true);
  }

  @override
  Future<void> stopVideo() async {
    await _webrtcService.toggleVideo(false);
  }

  @override
  Future<void> switchCamera() async {
    await _webrtcService.switchCamera();
  }

  @override
  Future<void> startScreenShare() async {
    await _webrtcService.startScreenShare();
  }

  @override
  Future<void> stopScreenShare() async {
    await _webrtcService.stopScreenShare();
  }

  @override
  bool isScreenShareSupported() {
    // Screen share is not supported on mobile, only web and desktop
    return kIsWeb || defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux;
  }

  @override
  Future<List<MediaDevice>> getAudioDevices() async {
    // In a full implementation, this would enumerate devices
    // For now, return default devices
    return const [
      MediaDevice(
        id: 'default_mic',
        label: 'Default Microphone',
        type: MediaDeviceType.audioInput,
        isDefault: true,
      ),
      MediaDevice(
        id: 'default_speaker',
        label: 'Default Speaker',
        type: MediaDeviceType.audioOutput,
        isDefault: true,
      ),
    ];
  }

  @override
  Future<List<MediaDevice>> getVideoDevices() async {
    // In a full implementation, this would enumerate devices
    // For now, return default devices
    return const [
      MediaDevice(
        id: 'default_camera',
        label: 'Default Camera',
        type: MediaDeviceType.videoInput,
        isDefault: true,
      ),
    ];
  }

  @override
  Future<void> selectAudioDevice(String deviceId) async {
    // In a full implementation, this would select the specific device
    // For now, this is a no-op
  }

  @override
  Future<void> selectVideoDevice(String deviceId) async {
    // In a full implementation, this would select the specific device
    // For now, this is a no-op
  }
}
