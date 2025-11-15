import 'dart:async';
import 'dart:developer';

import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCService {
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  MediaStream? _screenStream;
  final Map<String, MediaStream> _remoteStreams = {};
  bool _isScreenSharing = false;

  final StreamController<MediaStream> _localStreamController =
      StreamController<MediaStream>.broadcast();
  final StreamController<Map<String, MediaStream>> _remoteStreamsController =
      StreamController<Map<String, MediaStream>>.broadcast();

  Stream<MediaStream> get localStream => _localStreamController.stream;
  Stream<Map<String, MediaStream>> get remoteStreams =>
      _remoteStreamsController.stream;

  MediaStream? get currentLocalStream => _localStream;
  Map<String, MediaStream> get currentRemoteStreams => _remoteStreams;
  bool get isScreenSharing => _isScreenSharing;

  /// Initialize WebRTC with ICE servers
  Future<void> initialize() async {
    if (_peerConnection != null) {
      return; // Already initialized
    }

    final config = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
        {'urls': 'stun:stun1.l.google.com:19302'},
      ],
      'sdpSemantics': 'unified-plan',
    };

    final constraints = {
      'mandatory': {},
      'optional': [
        {'DtlsSrtpKeyAgreement': true},
      ],
    };

    _peerConnection = await createPeerConnection(config, constraints);
  }

  /// Create and get local media stream (audio + video)
  Future<MediaStream> createLocalStream({
    bool audio = true,
    bool video = true,
  }) async {
    if (_localStream != null) {
      return _localStream!;
    }

    final mediaConstraints = {
      'audio': audio,
      'video': video
          ? {
              'facingMode': 'user',
              'width': {'ideal': 1280},
              'height': {'ideal': 720},
            }
          : false,
    };

    _localStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);

    // Add tracks to peer connection
    if (_peerConnection != null) {
      _localStream!.getTracks().forEach((track) {
        _peerConnection!.addTrack(track, _localStream!);
      });
    }

    _localStreamController.add(_localStream!);
    return _localStream!;
  }

  /// Setup peer connection listeners
  void setupPeerConnectionListeners({
    required Function(RTCIceCandidate) onIceCandidate,
    required Function(MediaStream, String) onAddRemoteStream,
    required Function(String) onRemoveRemoteStream,
  }) {
    if (_peerConnection == null) return;

    // ICE candidate
    _peerConnection!.onIceCandidate = (candidate) {
      onIceCandidate(candidate);
    };

    // Add remote stream
    _peerConnection!.onTrack = (event) {
      if (event.streams.isNotEmpty) {
        final stream = event.streams[0];
        final streamId = stream.id;
        _remoteStreams[streamId] = stream;
        _remoteStreamsController.add(_remoteStreams);
        onAddRemoteStream(stream, streamId);
      }
    };

    // Remove remote stream
    _peerConnection!.onRemoveStream = (stream) {
      final streamId = stream.id;
      _remoteStreams.remove(streamId);
      _remoteStreamsController.add(_remoteStreams);
      onRemoveRemoteStream(streamId);
    };
  }

  /// Create SDP offer
  Future<RTCSessionDescription> createOffer() async {
    if (_peerConnection == null) {
      throw Exception('Peer connection not initialized');
    }

    final offer = await _peerConnection!.createOffer({
      'offerToReceiveAudio': true,
      'offerToReceiveVideo': true,
    });

    await _peerConnection!.setLocalDescription(offer);
    return offer;
  }

  /// Create SDP answer
  Future<RTCSessionDescription> createAnswer() async {
    if (_peerConnection == null) {
      throw Exception('Peer connection not initialized');
    }

    final answer = await _peerConnection!.createAnswer({
      'offerToReceiveAudio': true,
      'offerToReceiveVideo': true,
    });

    await _peerConnection!.setLocalDescription(answer);
    return answer;
  }

  /// Set remote description
  Future<void> setRemoteDescription(RTCSessionDescription description) async {
    if (_peerConnection == null) {
      throw Exception('Peer connection not initialized');
    }

    await _peerConnection!.setRemoteDescription(description);
  }

  /// Add ICE candidate
  Future<void> addIceCandidate(RTCIceCandidate candidate) async {
    if (_peerConnection == null) {
      throw Exception('Peer connection not initialized');
    }

    await _peerConnection!.addCandidate(candidate);
  }

  /// Toggle audio track
  Future<void> toggleAudio(bool enable) async {
    if (_localStream == null) return;

    final audioTracks = _localStream!.getAudioTracks();
    for (var track in audioTracks) {
      track.enabled = enable;
    }
  }

  /// Toggle video track
  Future<void> toggleVideo(bool enable) async {
    if (_localStream == null) return;

    final videoTracks = _localStream!.getVideoTracks();
    for (var track in videoTracks) {
      track.enabled = enable;
    }
  }

  /// Switch camera (front/back)
  Future<void> switchCamera() async {
    if (_localStream == null) return;

    final videoTracks = _localStream!.getVideoTracks();
    if (videoTracks.isNotEmpty) {
      await Helper.switchCamera(videoTracks[0]);
    }
  }

  /// Start screen sharing
  Future<MediaStream?> startScreenShare() async {
    if (_peerConnection == null || _isScreenSharing) {
      return null;
    }

    try {
      // Request screen sharing stream
      final mediaConstraints = {
        'audio': false,
        'video': true,
      };

      _screenStream =
          await navigator.mediaDevices.getDisplayMedia(mediaConstraints);

      if (_screenStream != null) {
        // Remove existing video tracks from peer connection
        final senders = await _peerConnection!.getSenders();
        for (var sender in senders) {
          if (sender.track?.kind == 'video') {
            await _peerConnection!.removeTrack(sender);
          }
        }

        // Add screen share video track
        final screenVideoTracks = _screenStream!.getVideoTracks();
        if (screenVideoTracks.isNotEmpty) {
          await _peerConnection!.addTrack(
            screenVideoTracks[0],
            _screenStream!,
          );

          // Listen for when user stops sharing via browser UI
          screenVideoTracks[0].onEnded = () {
            stopScreenShare();
          };
        }

        _isScreenSharing = true;

        // Update local stream controller to show screen share
        _localStreamController.add(_screenStream!);
      }

      return _screenStream;
    } catch (e) {
      log('Error starting screen share: $e');
      return null;
    }
  }

  /// Stop screen sharing
  Future<void> stopScreenShare() async {
    if (!_isScreenSharing || _peerConnection == null) {
      return;
    }

    try {
      // Remove screen share tracks from peer connection
      final senders = await _peerConnection!.getSenders();
      for (var sender in senders) {
        if (sender.track?.kind == 'video') {
          await _peerConnection!.removeTrack(sender);
        }
      }

      // Stop and dispose screen stream
      _screenStream?.getTracks().forEach((track) {
        track.stop();
      });
      await _screenStream?.dispose();
      _screenStream = null;

      // Re-add camera video track
      if (_localStream != null) {
        final videoTracks = _localStream!.getVideoTracks();
        if (videoTracks.isNotEmpty) {
          await _peerConnection!.addTrack(
            videoTracks[0],
            _localStream!,
          );
        }

        // Update local stream controller to show camera again
        _localStreamController.add(_localStream!);
      }

      _isScreenSharing = false;
    } catch (e) {
      log('Error stopping screen share: $e');
    }
  }

  /// Close and cleanup resources
  Future<void> dispose() async {
    // Close streams
    _localStream?.getTracks().forEach((track) {
      track.stop();
    });
    await _localStream?.dispose();
    _localStream = null;

    // Close screen stream
    _screenStream?.getTracks().forEach((track) {
      track.stop();
    });
    await _screenStream?.dispose();
    _screenStream = null;

    for (var stream in _remoteStreams.values) {
      stream.getTracks().forEach((track) {
        track.stop();
      });
      await stream.dispose();
    }
    _remoteStreams.clear();

    // Close peer connection
    await _peerConnection?.close();
    _peerConnection = null;

    // Reset screen sharing flag
    _isScreenSharing = false;

    // Close stream controllers
    await _localStreamController.close();
    await _remoteStreamsController.close();
  }
}
