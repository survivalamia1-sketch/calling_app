import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import '../models/meeting.dart';

class CallProvider with ChangeNotifier {
  RTCVideoRenderer? _localRenderer;
  final Map<String, RTCVideoRenderer> _remoteRenderers = {};
  final Map<String, Participant> _participants = {};

  bool _isMuted = false;
  bool _isVideoEnabled = true;
  bool _isScreenSharing = false;
  bool _isConnected = false;

  Meeting? _activeMeeting;
  Duration _callDuration = Duration.zero;

  // Getters
  RTCVideoRenderer? get localRenderer => _localRenderer;
  Map<String, RTCVideoRenderer> get remoteRenderers => _remoteRenderers;
  Map<String, Participant> get participants => _participants;

  bool get isMuted => _isMuted;
  bool get isVideoEnabled => _isVideoEnabled;
  bool get isScreenSharing => _isScreenSharing;
  bool get isConnected => _isConnected;

  Meeting? get activeMeeting => _activeMeeting;
  Duration get callDuration => _callDuration;

  Future<void> initializeLocalRenderer() async {
    _localRenderer = RTCVideoRenderer();
    await _localRenderer!.initialize();
    notifyListeners();
  }

  Future<void> startLocalStream() async {
    try {
      final Map<String, dynamic> mediaConstraints = {
        'audio': true,
        'video': {
          'facingMode': 'user',
          'width': 1280,
          'height': 720,
        }
      };

      final stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      _localRenderer?.srcObject = stream;
      _isVideoEnabled = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error starting local stream: $e');
    }
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    _localRenderer?.srcObject?.getAudioTracks().forEach((track) {
      track.enabled = !_isMuted;
    });
    notifyListeners();
  }

  void toggleVideo() {
    _isVideoEnabled = !_isVideoEnabled;
    _localRenderer?.srcObject?.getVideoTracks().forEach((track) {
      track.enabled = _isVideoEnabled;
    });
    notifyListeners();
  }

  void toggleScreenShare() async {
    // Implementation for screen sharing
    _isScreenSharing = !_isScreenSharing;
    notifyListeners();
  }

  void addParticipant(Participant participant) {
    _participants[participant.id] = participant;
    notifyListeners();
  }

  void removeParticipant(String participantId) {
    _participants.remove(participantId);
    _remoteRenderers[participantId]?.dispose();
    _remoteRenderers.remove(participantId);
    notifyListeners();
  }

  void updateParticipant(Participant participant) {
    _participants[participant.id] = participant;
    notifyListeners();
  }

  void setActiveMeeting(Meeting meeting) {
    _activeMeeting = meeting;
    notifyListeners();
  }

  void updateCallDuration(Duration duration) {
    _callDuration = duration;
    notifyListeners();
  }

  void setConnected(bool connected) {
    _isConnected = connected;
    notifyListeners();
  }

  Future<void> endCall() async {
    // Stop local stream
    await _localRenderer?.srcObject?.dispose();
    await _localRenderer?.dispose();
    _localRenderer = null;

    // Dispose remote renderers
    for (var renderer in _remoteRenderers.values) {
      await renderer.dispose();
    }
    _remoteRenderers.clear();

    // Clear state
    _participants.clear();
    _activeMeeting = null;
    _isConnected = false;
    _isMuted = false;
    _isVideoEnabled = true;
    _isScreenSharing = false;
    _callDuration = Duration.zero;

    notifyListeners();
  }

  @override
  void dispose() {
    endCall();
    super.dispose();
  }
}
