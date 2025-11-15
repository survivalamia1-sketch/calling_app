import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/constants/api_constants.dart';

enum SignalingState {
  disconnected,
  connecting,
  connected,
  error,
}

class SignalingMessage {
  final String type;
  final String? roomId;
  final String? userId;
  final Map<String, dynamic>? data;

  SignalingMessage({
    required this.type,
    this.roomId,
    this.userId,
    this.data,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        if (roomId != null) 'room_id': roomId,
        if (userId != null) 'user_id': userId,
        if (data != null) ...data!,
      };

  factory SignalingMessage.fromJson(Map<String, dynamic> json) {
    return SignalingMessage(
      type: json['type'] as String,
      roomId: json['room_id'] as String?,
      userId: json['user_id'] as String?,
      data: json,
    );
  }
}

class SignalingService {
  WebSocketChannel? _channel;
  final StreamController<SignalingMessage> _messageController =
      StreamController<SignalingMessage>.broadcast();
  final StreamController<SignalingState> _stateController =
      StreamController<SignalingState>.broadcast();

  SignalingState _currentState = SignalingState.disconnected;

  Stream<SignalingMessage> get messages => _messageController.stream;
  Stream<SignalingState> get state => _stateController.stream;
  SignalingState get currentState => _currentState;

  /// Connect to signaling server
  Future<void> connect({
    required String roomId,
    required String userId,
  }) async {
    if (_currentState == SignalingState.connected) {
      return; // Already connected
    }

    try {
      _updateState(SignalingState.connecting);

      // Use WebSocket URL from constants
      final wsUrl = ApiConstants.wsUrl;

      _channel = WebSocketChannel.connect(
        Uri.parse('$wsUrl?room_id=$roomId&user_id=$userId'),
      );

      _channel!.stream.listen(
        (data) {
          try {
            final message = json.decode(data as String);
            final signalingMessage = SignalingMessage.fromJson(message);
            _messageController.add(signalingMessage);
          } catch (e) {
            log('Error parsing signaling message: $e');
          }
        },
        onError: (error) {
          log('WebSocket error: $error');
          _updateState(SignalingState.error);
        },
        onDone: () {
          log('WebSocket connection closed');
          _updateState(SignalingState.disconnected);
        },
      );

      _updateState(SignalingState.connected);
    } catch (e) {
      log('Failed to connect to signaling server: $e');
      _updateState(SignalingState.error);
      rethrow;
    }
  }

  /// Send a signaling message
  void send(SignalingMessage message) {
    if (_channel == null || _currentState != SignalingState.connected) {
      throw Exception('Not connected to signaling server');
    }

    final jsonMessage = json.encode(message.toJson());
    _channel!.sink.add(jsonMessage);
  }

  /// Join a room
  void joinRoom(String roomId, String userId) {
    send(SignalingMessage(
      type: 'join',
      roomId: roomId,
      userId: userId,
    ));
  }

  /// Leave a room
  void leaveRoom(String roomId, String userId) {
    send(SignalingMessage(
      type: 'leave',
      roomId: roomId,
      userId: userId,
    ));
  }

  /// Send SDP offer
  void sendOffer(String roomId, String userId, RTCSessionDescription offer) {
    send(SignalingMessage(
      type: 'offer',
      roomId: roomId,
      userId: userId,
      data: {
        'sdp': offer.sdp,
        'sdp_type': offer.type,
      },
    ));
  }

  /// Send SDP answer
  void sendAnswer(String roomId, String userId, RTCSessionDescription answer) {
    send(SignalingMessage(
      type: 'answer',
      roomId: roomId,
      userId: userId,
      data: {
        'sdp': answer.sdp,
        'sdp_type': answer.type,
      },
    ));
  }

  /// Send ICE candidate
  void sendIceCandidate(
    String roomId,
    String userId,
    RTCIceCandidate candidate,
  ) {
    send(SignalingMessage(
      type: 'ice_candidate',
      roomId: roomId,
      userId: userId,
      data: {
        'candidate': candidate.candidate,
        'sdp_mid': candidate.sdpMid,
        'sdp_mline_index': candidate.sdpMLineIndex,
      },
    ));
  }

  /// Start screen sharing
  void startScreenShare(String roomId, String userId) {
    send(SignalingMessage(
      type: 'start_screen_share',
      roomId: roomId,
      userId: userId,
    ));
  }

  /// Stop screen sharing
  void stopScreenShare(String roomId, String userId) {
    send(SignalingMessage(
      type: 'stop_screen_share',
      roomId: roomId,
      userId: userId,
    ));
  }

  /// Update signaling state
  void _updateState(SignalingState newState) {
    _currentState = newState;
    _stateController.add(newState);
  }

  /// Disconnect and cleanup
  Future<void> dispose() async {
    await _channel?.sink.close();
    _channel = null;
    _updateState(SignalingState.disconnected);
    await _messageController.close();
    await _stateController.close();
  }
}
