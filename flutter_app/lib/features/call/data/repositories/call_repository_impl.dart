import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/call.dart';
import '../../domain/repositories/call_repository.dart';
import '../services/signaling_service.dart';
import '../services/webrtc_service.dart';

class CallRepositoryImpl implements CallRepository {
  final WebRTCService webrtcService;
  final SignalingService signalingService;
  final FlutterSecureStorage storage;
  final Dio dio;

  Call? _currentCall;
  final StreamController<Call> _callController =
      StreamController<Call>.broadcast();

  CallRepositoryImpl({
    required this.webrtcService,
    required this.signalingService,
    required this.storage,
    required this.dio,
  });

  @override
  Stream<Call> get callStream => _callController.stream;

  @override
  Future<Either<Failure, Unit>> initialize() async {
    try {
      await webrtcService.initialize();
      // Note: WebSocket connection happens in joinCall() with room_id and user_id
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to initialize call: $e'));
    }
  }

  @override
  Future<Either<Failure, Call>> joinCall(String roomId) async {
    try {
      // Ensure WebRTC is initialized first
      await webrtcService.initialize();

      // Get user ID from cached user data
      final userDataJson = await storage.read(key: AppConstants.userDataKey);
      if (userDataJson == null) {
        return const Left(UnauthorizedFailure(message: 'User not authenticated'));
      }

      final userData = jsonDecode(userDataJson) as Map<String, dynamic>;
      final userId = userData['id'] as String;

      // Call HTTP API to join room (this starts the room and duration timer)
      try {
        await dio.post(
          ApiConstants.roomJoin(roomId),
          data: {
            'name': '${userData['first_name']} ${userData['last_name']}',
          },
        );
      } catch (e) {
        log('Failed to call join room API: $e');
        // Continue anyway - the room might already be started
      }

      // Connect to signaling server with room and user IDs
      await signalingService.connect(
        roomId: roomId,
        userId: userId,
      );

      // Create local media stream
      try {
        await webrtcService.createLocalStream(audio: true, video: true);
      } catch (e) {
        final errorMessage = e.toString().toLowerCase();
        String userFriendlyMessage;
        
        if (errorMessage.contains('notreadable') || 
            errorMessage.contains('could not start video source')) {
          userFriendlyMessage = 
              'Unable to access camera/microphone. Please check:\n'
              '• Camera/microphone is not being used by another application\n'
              '• Browser permissions are granted\n'
              '• Device is connected and working';
        } else if (errorMessage.contains('notallowed') || 
                   errorMessage.contains('permission denied')) {
          userFriendlyMessage = 
              'Camera/microphone permission denied. Please grant permissions in your browser settings.';
        } else if (errorMessage.contains('notfound') || 
                   errorMessage.contains('no device')) {
          userFriendlyMessage = 
              'No camera/microphone found. Please connect a camera and microphone.';
        } else {
          userFriendlyMessage = 'Failed to access camera/microphone: $e';
        }
        
        return Left(ServerFailure(message: userFriendlyMessage));
      }

      // Setup WebRTC peer connection listeners
      webrtcService.setupPeerConnectionListeners(
        onIceCandidate: (candidate) {
          signalingService.sendIceCandidate(roomId, userId, candidate);
        },
        onAddRemoteStream: (stream, streamId) {
          // Update call with new participant
          _updateCallWithRemoteStream(stream, streamId);
        },
        onRemoveRemoteStream: (streamId) {
          // Remove participant from call
          _removeParticipantByStreamId(streamId);
        },
      );

      // Listen to signaling messages
      _setupSignalingListeners(roomId, userId);

      // Join the room
      signalingService.joinRoom(roomId, userId);

      // Create and send offer
      final offer = await webrtcService.createOffer();
      signalingService.sendOffer(roomId, userId, offer);

      // Create initial call state
      _currentCall = Call(
        roomId: roomId,
        meetingId: roomId,
        status: CallStatus.connecting,
        type: CallType.video,
        isAudioEnabled: true,
        isVideoEnabled: true,
        participants: const [],
        startTime: DateTime.now(),
      );

      _callController.add(_currentCall!);

      return Right(_currentCall!);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to join call: $e'));
    }
  }

  void _setupSignalingListeners(String roomId, String userId) {
    signalingService.messages.listen((message) async {
      try {
        switch (message.type) {
          case 'offer':
            // Received offer from another peer
            final sdp = message.data?['sdp'] as String?;
            final sdpType = message.data?['sdp_type'] as String?;
            if (sdp != null && sdpType != null) {
              final offer = RTCSessionDescription(sdp, sdpType);
              await webrtcService.setRemoteDescription(offer);

              // Create and send answer
              final answer = await webrtcService.createAnswer();
              signalingService.sendAnswer(roomId, userId, answer);
            }
            break;

          case 'answer':
            // Received answer from another peer
            final sdp = message.data?['sdp'] as String?;
            final sdpType = message.data?['sdp_type'] as String?;
            if (sdp != null && sdpType != null) {
              final answer = RTCSessionDescription(sdp, sdpType);
              await webrtcService.setRemoteDescription(answer);

              // Update call status to connected
              _updateCallStatus(CallStatus.connected);
            }
            break;

          case 'ice_candidate':
            // Received ICE candidate
            final candidate = message.data?['candidate'] as String?;
            final sdpMid = message.data?['sdp_mid'] as String?;
            final sdpMLineIndex = message.data?['sdp_mline_index'] as int?;
            if (candidate != null && sdpMid != null && sdpMLineIndex != null) {
              final iceCandidate = RTCIceCandidate(
                candidate,
                sdpMid,
                sdpMLineIndex,
              );
              await webrtcService.addIceCandidate(iceCandidate);
            }
            break;

          case 'user_joined':
            // New user joined the call
            _updateCallStatus(CallStatus.connected);
            break;

          case 'user_left':
            // User left the call
            final leftUserId = message.userId;
            if (leftUserId != null) {
              _removeParticipantByUserId(leftUserId);
            }
            break;
        }
      } catch (e) {
        log('Error handling signaling message: $e');
      }
    });
  }

  void _updateCallWithRemoteStream(MediaStream stream, String streamId) {
    if (_currentCall == null) return;

    // Create new participant
    final participant = CallParticipant(
      userId: streamId,
      name: 'Participant $streamId',
      isAudioEnabled: true,
      isVideoEnabled: true,
      isScreenSharing: false,
      joinedAt: DateTime.now(),
    );

    final updatedParticipants = [..._currentCall!.participants, participant];

    _currentCall = _currentCall!.copyWith(
      participants: updatedParticipants,
      status: CallStatus.connected,
    );

    _callController.add(_currentCall!);
  }

  void _removeParticipantByStreamId(String streamId) {
    if (_currentCall == null) return;

    final updatedParticipants =
        _currentCall!.participants.where((p) => p.userId != streamId).toList();

    _currentCall = _currentCall!.copyWith(participants: updatedParticipants);
    _callController.add(_currentCall!);
  }

  void _removeParticipantByUserId(String userId) {
    if (_currentCall == null) return;

    final updatedParticipants =
        _currentCall!.participants.where((p) => p.userId != userId).toList();

    _currentCall = _currentCall!.copyWith(participants: updatedParticipants);
    _callController.add(_currentCall!);
  }

  void _updateCallStatus(CallStatus status) {
    if (_currentCall == null) return;

    _currentCall = _currentCall!.copyWith(status: status);
    _callController.add(_currentCall!);
  }

  @override
  Future<Either<Failure, Unit>> leaveCall() async {
    try {
      if (_currentCall == null) {
        return const Right(unit);
      }

      // Get user ID from cached user data
      final userDataJson = await storage.read(key: AppConstants.userDataKey);
      if (userDataJson != null) {
        final userData = jsonDecode(userDataJson) as Map<String, dynamic>;
        final userId = userData['id'] as String;
        signalingService.leaveRoom(_currentCall!.roomId, userId);
      }

      // Update call status
      _currentCall = _currentCall!.copyWith(
        status: CallStatus.ended,
        endTime: DateTime.now(),
      );
      _callController.add(_currentCall!);

      // Cleanup resources
      await webrtcService.dispose();
      _currentCall = null;

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to leave call: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleAudio(bool enable) async {
    try {
      await webrtcService.toggleAudio(enable);

      if (_currentCall != null) {
        _currentCall = _currentCall!.copyWith(isAudioEnabled: enable);
        _callController.add(_currentCall!);
      }

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to toggle audio: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleVideo(bool enable) async {
    try {
      await webrtcService.toggleVideo(enable);

      if (_currentCall != null) {
        _currentCall = _currentCall!.copyWith(isVideoEnabled: enable);
        _callController.add(_currentCall!);
      }

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to toggle video: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> switchCamera() async {
    try {
      await webrtcService.switchCamera();
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to switch camera: $e'));
    }
  }

  @override
  Future<void> dispose() async {
    await webrtcService.dispose();
    await signalingService.dispose();
    await _callController.close();
    _currentCall = null;
  }
}
