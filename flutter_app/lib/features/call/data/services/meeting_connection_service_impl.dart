import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../domain/entities/call_connection_state.dart';
import '../../domain/entities/network_quality.dart';
import '../../domain/entities/participant.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/repositories/meeting_connection_service.dart';
import 'signaling_service.dart';
import 'webrtc_service.dart';

/// Real implementation of MeetingConnectionService using WebSocket and WebRTC
class MeetingConnectionServiceImpl implements MeetingConnectionService {
  final WebRTCService _webrtcService;
  final SignalingService _signalingService;
  final ChatRepository _chatRepository;

  final StreamController<CallConnectionState> _connectionStateController =
      StreamController<CallConnectionState>.broadcast();
  final StreamController<List<Participant>> _participantsController =
      StreamController<List<Participant>>.broadcast();
  final StreamController<NetworkQuality> _networkQualityController =
      StreamController<NetworkQuality>.broadcast();

  final Map<String, Participant> _participants = {};
  MeetingInfo? _meetingInfo;
  String? _currentUserId;
  String? _currentRoomId;
  StreamSubscription<SignalingMessage>? _signalingSubscription;
  StreamSubscription<SignalingState>? _signalingStateSubscription;

  MeetingConnectionServiceImpl({
    required WebRTCService webrtcService,
    required SignalingService signalingService,
    required ChatRepository chatRepository,
  })  : _webrtcService = webrtcService,
        _signalingService = signalingService,
        _chatRepository = chatRepository;

  @override
  Future<void> connectToRoom(MeetingJoinParams params) async {
    try {
      _currentUserId = params.userId;
      _currentRoomId = params.roomId;

      // Update connection state
      _updateConnectionState(CallConnectionState.connecting);

      // Initialize WebRTC
      await _webrtcService.initialize();

      // Create local media stream
      await _webrtcService.createLocalStream(
        audio: params.joinWithAudio,
        video: params.joinWithVideo,
      );

      // Setup WebRTC listeners
      _webrtcService.setupPeerConnectionListeners(
        onIceCandidate: (candidate) {
          if (_currentRoomId != null && _currentUserId != null) {
            _signalingService.sendIceCandidate(
              _currentRoomId!,
              _currentUserId!,
              candidate,
            );
          }
        },
        onAddRemoteStream: (stream, streamId) {
          // Handle new remote stream (participant joined)
          // In a real implementation, you'd extract participant info from signaling
        },
        onRemoveRemoteStream: (streamId) {
          // Handle removed remote stream (participant left)
        },
      );

      // Connect to signaling server
      await _signalingService.connect(
        roomId: params.roomId,
        userId: params.userId,
      );

      // Subscribe to signaling messages
      _signalingSubscription = _signalingService.messages.listen(
        _handleSignalingMessage,
      );

      // Subscribe to signaling state changes
      _signalingStateSubscription = _signalingService.state.listen((state) {
        if (state == SignalingState.disconnected) {
          _updateConnectionState(CallConnectionState.disconnected);
        } else if (state == SignalingState.error) {
          _updateConnectionState(CallConnectionState.disconnected);
        }
      });

      // Join the room via signaling
      _signalingService.joinRoom(params.roomId, params.userId);

      // Initialize chat repository
      await _chatRepository.initialize(
        roomId: params.roomId,
        userId: params.userId,
      );

      // Create meeting info
      _meetingInfo = MeetingInfo(
        id: params.roomId,
        name: 'Meeting ${params.roomId}',
        hostName: params.displayName,
        startedAt: DateTime.now(),
        isRecording: false,
        meetingCode: params.roomId,
        password: params.password,
      );

      // Add current user as participant
      _addParticipant(Participant(
        id: params.userId,
        displayName: params.displayName,
        isMuted: !params.joinWithAudio,
        isVideoOn: params.joinWithVideo,
        isSpeaking: false,
        isHost: true,
        isScreenSharing: false,
        isHandRaised: false,
        avatarUrl: null,
      ));

      // Update connection state to connected
      _updateConnectionState(CallConnectionState.connected);

      // Set initial network quality
      _networkQualityController.add(
        const NetworkQuality(
          level: NetworkQualityLevel.good,
          latency: 45,
          packetLoss: 0.5,
        ),
      );
    } catch (e) {
      _updateConnectionState(CallConnectionState.disconnected);
      rethrow;
    }
  }

  @override
  Future<void> leaveRoom() async {
    if (_currentRoomId != null && _currentUserId != null) {
      _signalingService.leaveRoom(_currentRoomId!, _currentUserId!);
    }

    await _cleanup();
  }

  @override
  Future<void> endMeetingForAll() async {
    // In a real implementation, this would send a signal to end for all
    // For now, just leave normally
    await leaveRoom();
  }

  @override
  Stream<CallConnectionState> watchConnectionState() {
    return _connectionStateController.stream;
  }

  @override
  Stream<List<Participant>> watchParticipants() {
    return _participantsController.stream;
  }

  @override
  Stream<NetworkQuality> watchNetworkQuality() {
    return _networkQualityController.stream;
  }

  @override
  Future<void> muteParticipant(String participantId) async {
    // In a real implementation, this would send a signaling message
    // to request the participant to mute themselves
  }

  @override
  Future<void> removeParticipant(String participantId) async {
    // In a real implementation, this would send a signaling message
    // to kick the participant
  }

  @override
  Future<MeetingInfo> getMeetingInfo() async {
    if (_meetingInfo != null) {
      return _meetingInfo!;
    }

    // Return default meeting info if not connected
    return MeetingInfo(
      id: _currentRoomId ?? 'unknown',
      name: 'Meeting',
      startedAt: DateTime.now(),
      isRecording: false,
    );
  }

  @override
  Future<void> admitParticipant(String participantId) async {
    // In a real implementation, this would admit from waiting room
  }

  @override
  Future<void> rejectParticipant(String participantId) async {
    // In a real implementation, this would reject from waiting room
  }

  // === Helper Methods ===

  void _updateConnectionState(CallConnectionState newState) {
    _connectionStateController.add(newState);
  }

  void _addParticipant(Participant participant) {
    _participants[participant.id] = participant;
    _participantsController.add(_participants.values.toList());
  }

  void _removeParticipant(String participantId) {
    _participants.remove(participantId);
    _participantsController.add(_participants.values.toList());
  }

  void _handleSignalingMessage(SignalingMessage message) async {
    switch (message.type) {
      case 'user_joined':
        // Extract participant info and add to list
        final userId = message.userId ?? message.data?['user_id'];
        final displayName = message.data?['display_name'] ?? 'Guest';
        if (userId != null && userId != _currentUserId) {
          _addParticipant(Participant(
            id: userId,
            displayName: displayName,
            isMuted: false,
            isVideoOn: true,
            isSpeaking: false,
            isHost: false,
            isScreenSharing: false,
            isHandRaised: false,
            avatarUrl: null,
          ));
        }
        break;

      case 'user_left':
        final userId = message.userId ?? message.data?['user_id'];
        if (userId != null) {
          _removeParticipant(userId);
        }
        break;

      case 'offer':
        // Handle WebRTC offer from another peer
        if (message.data != null) {
          final sdp = message.data!['sdp'] as String?;
          final sdpType = message.data!['sdp_type'] as String?;
          if (sdp != null && sdpType != null) {
            final description = RTCSessionDescription(sdp, sdpType);
            await _webrtcService.setRemoteDescription(description);

            // Create and send answer
            final answer = await _webrtcService.createAnswer();
            _signalingService.sendAnswer(
              _currentRoomId!,
              _currentUserId!,
              answer,
            );
          }
        }
        break;

      case 'answer':
        // Handle WebRTC answer from another peer
        if (message.data != null) {
          final sdp = message.data!['sdp'] as String?;
          final sdpType = message.data!['sdp_type'] as String?;
          if (sdp != null && sdpType != null) {
            final description = RTCSessionDescription(sdp, sdpType);
            await _webrtcService.setRemoteDescription(description);
          }
        }
        break;

      case 'ice_candidate':
        // Handle ICE candidate from another peer
        if (message.data != null) {
          final candidate = message.data!['candidate'] as String?;
          final sdpMid = message.data!['sdp_mid'] as String?;
          final sdpMLineIndex = message.data!['sdp_mline_index'] as int?;
          if (candidate != null && sdpMid != null && sdpMLineIndex != null) {
            final iceCandidate = RTCIceCandidate(
              candidate,
              sdpMid,
              sdpMLineIndex,
            );
            await _webrtcService.addIceCandidate(iceCandidate);
          }
        }
        break;

      default:
        // Handle other message types
        break;
    }
  }

  Future<void> _cleanup() async {
    await _signalingSubscription?.cancel();
    await _signalingStateSubscription?.cancel();
    await _signalingService.dispose();
    await _webrtcService.dispose();

    _participants.clear();
    _participantsController.add([]);
    _updateConnectionState(CallConnectionState.disconnected);

    _currentUserId = null;
    _currentRoomId = null;
    _meetingInfo = null;
  }

  /// Dispose and cleanup
  void dispose() {
    _connectionStateController.close();
    _participantsController.close();
    _networkQualityController.close();
  }
}
