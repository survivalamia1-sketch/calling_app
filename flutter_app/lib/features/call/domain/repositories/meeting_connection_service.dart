import '../entities/call_connection_state.dart';
import '../entities/network_quality.dart';
import '../entities/participant.dart';

/// Service interface for managing the meeting connection
abstract class MeetingConnectionService {
  /// Connect to a meeting room
  Future<void> connectToRoom(MeetingJoinParams params);

  /// Leave the current meeting room
  Future<void> leaveRoom();

  /// End the meeting for all participants (host only)
  Future<void> endMeetingForAll();

  /// Watch the connection state changes
  Stream<CallConnectionState> watchConnectionState();

  /// Watch participants list changes
  Stream<List<Participant>> watchParticipants();

  /// Watch network quality changes
  Stream<NetworkQuality> watchNetworkQuality();

  /// Mute a specific participant (host only)
  Future<void> muteParticipant(String participantId);

  /// Remove a participant from the meeting (host only)
  Future<void> removeParticipant(String participantId);

  /// Get current meeting information
  Future<MeetingInfo> getMeetingInfo();

  /// Admit participant from waiting room (host only)
  Future<void> admitParticipant(String participantId);

  /// Reject participant from waiting room (host only)
  Future<void> rejectParticipant(String participantId);
}

/// Parameters needed to join a meeting
class MeetingJoinParams {
  final String roomId;
  final String userId;
  final String displayName;
  final bool joinWithAudio;
  final bool joinWithVideo;
  final String? password;

  const MeetingJoinParams({
    required this.roomId,
    required this.userId,
    required this.displayName,
    this.joinWithAudio = true,
    this.joinWithVideo = true,
    this.password,
  });
}

/// Meeting information
class MeetingInfo {
  final String id;
  final String name;
  final String? hostName;
  final DateTime startedAt;
  final bool isRecording;
  final String? meetingCode;
  final String? password;

  const MeetingInfo({
    required this.id,
    required this.name,
    this.hostName,
    required this.startedAt,
    this.isRecording = false,
    this.meetingCode,
    this.password,
  });
}
