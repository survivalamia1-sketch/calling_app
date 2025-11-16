import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/scheduled_meeting.dart';
import '../models/meeting_model.dart';
import '../models/scheduled_meeting_model.dart';

abstract class MeetingsRemoteDataSource {
  // Regular Meetings
  Future<List<MeetingModel>> getMeetings({
    String? status,
    int? limit,
    int? offset,
  });

  Future<MeetingModel> getMeetingById(String id);

  Future<MeetingModel> getMeetingByCode(String code);

  Future<MeetingModel> createMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  });

  Future<MeetingModel> updateMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  });

  Future<void> deleteMeeting(String id);

  Future<String> joinMeeting(String roomCode);

  Future<void> leaveMeeting(String roomId);

  // Scheduled Meetings
  Future<List<ScheduledMeetingModel>> getScheduledMeetings({
    ScheduledMeetingStatus? status,
    int? limit,
    int? offset,
  });

  Future<ScheduledMeetingModel> getScheduledMeetingById(String id);

  Future<ScheduledMeetingModel> createScheduledMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    required int durationMinutes,
    int? maxParticipants,
    String? password,
    bool requiresApproval,
    bool waitingRoomEnabled,
    bool allowJoinBeforeHost,
    bool muteOnEntry,
    List<String> invitedEmails,
    bool isRecurring,
    RecurrencePattern? recurrencePattern,
  });

  Future<ScheduledMeetingModel> updateScheduledMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? durationMinutes,
    int? maxParticipants,
    String? password,
    bool? requiresApproval,
    bool? waitingRoomEnabled,
    bool? allowJoinBeforeHost,
    bool? muteOnEntry,
    List<String>? invitedEmails,
  });

  Future<void> deleteScheduledMeeting(String id);

  Future<String> startScheduledMeeting(String id);

  Future<List<ScheduledMeetingModel>> getUpcomingScheduledMeetings({
    int? limit,
  });
}

class MeetingsRemoteDataSourceImpl implements MeetingsRemoteDataSource {
  final Dio client;

  MeetingsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MeetingModel>> getMeetings({
    String? status,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (status != null) queryParams['status'] = status;
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await client.get(
        ApiConstants.rooms,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        // Backend returns array directly, not wrapped
        final List<dynamic> data;
        if (response.data is List) {
          data = response.data as List<dynamic>;
        } else if (response.data is Map && response.data['rooms'] != null) {
          data = response.data['rooms'] as List<dynamic>;
        } else {
          data = [];
        }
        return data.map((json) => MeetingModel.fromJson(json)).toList();
      } else {
        throw const ServerException(message: 'Failed to get meetings');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<MeetingModel> getMeetingById(String id) async {
    try {
      final response = await client.get('${ApiConstants.rooms}/$id');

      if (response.statusCode == 200) {
        // Backend returns room directly, not wrapped
        return MeetingModel.fromJson(response.data['room'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to get meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Meeting not found');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<MeetingModel> getMeetingByCode(String code) async {
    // Note: Join by code endpoint not available in backend
    // Using room ID lookup instead - code should be converted to room ID
    throw const ServerException(
        message: 'Join by code not implemented. Use room ID instead.');
  }

  @override
  Future<MeetingModel> createMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  }) async {
    try {
      // Prepare the request data - only include non-null/non-empty values
      final requestData = <String, dynamic>{
        'name': title, // Backend expects 'name', not 'title'
        'description': description,
      };

      // Only add scheduled_at if it's not the same as current time (i.e., it's actually scheduled)
      // Format as RFC3339 which is what Go expects
      requestData['scheduled_at'] = scheduledAt.toUtc().toIso8601String();

      // Optional fields
      if (maxParticipants != null && maxParticipants > 0) {
        requestData['max_participants'] = maxParticipants;
      }

      if (requiresApproval != null) {
        requestData['has_waiting_room'] = requiresApproval;
      }

      final response = await client.post(
        ApiConstants.rooms,
        data: requestData,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Backend returns room directly, not wrapped
        return MeetingModel.fromJson(response.data['room'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to create meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 400) {
        // Extract more detailed error message from backend
        final errorMsg = e.response?.data['error'] ??
                        e.response?.data['message'] ??
                        e.response?.data.toString() ??
                        'Invalid meeting data';
        throw ServerException(message: errorMsg);
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<MeetingModel> updateMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? duration,
    int? maxParticipants,
    bool? requiresApproval,
  }) async {
    // Note: Backend does not have an update room endpoint
    // Rooms can only be created, deleted, or ended
    throw const ServerException(
        message: 'Update room not implemented in backend');
  }

  @override
  Future<void> deleteMeeting(String id) async {
    try {
      final response = await client.delete('${ApiConstants.rooms}/$id');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw const ServerException(message: 'Failed to delete meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Meeting not found');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<String> joinMeeting(String roomCode) async {
    try {
      // Backend expects room ID in URL, password and name in body
      // roomCode should be the room ID (UUID), not a code
      final response = await client.post(
        ApiConstants.roomJoin(roomCode), // roomCode is actually room ID
        data: {
          'password': '', // Optional, required only if room is locked
          'name': '', // Optional, for guest users
        },
      );

      if (response.statusCode == 200) {
        return response.data['room_id'] as String;
      } else {
        throw const ServerException(message: 'Failed to join meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Meeting not found');
      }
      if (e.response?.statusCode == 403) {
        throw const ServerException(
            message: 'You are not allowed to join this meeting');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> leaveMeeting(String roomId) async {
    try {
      // Backend expects POST to /rooms/{id}/leave, not /rooms/{id}
      final response = await client.post(
        ApiConstants.roomLeave(roomId), // Use roomLeave endpoint
        data: {}, // Empty body
      );

      if (response.statusCode != 200) {
        throw const ServerException(message: 'Failed to leave meeting');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  // Scheduled Meetings Implementation
  // NOTE: These are interface methods ready for backend API implementation
  // Currently returns empty/error as backend endpoints are not yet available

  @override
  Future<List<ScheduledMeetingModel>> getScheduledMeetings({
    ScheduledMeetingStatus? status,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (status != null) queryParams['status'] = status.name;
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await client.get(
        '/scheduled-meetings', // Backend endpoint to be implemented
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['meetings'] ?? [];
        return data.map((json) => ScheduledMeetingModel.fromJson(json)).toList();
      } else {
        throw const ServerException(message: 'Failed to get scheduled meetings');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      // Return empty list if endpoint not implemented
      return [];
    }
  }

  @override
  Future<ScheduledMeetingModel> getScheduledMeetingById(String id) async {
    try {
      final response = await client.get('/scheduled-meetings/$id');

      if (response.statusCode == 200) {
        return ScheduledMeetingModel.fromJson(response.data['meeting'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to get scheduled meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Scheduled meeting not found');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<ScheduledMeetingModel> createScheduledMeeting({
    required String title,
    required String description,
    required DateTime scheduledAt,
    required int durationMinutes,
    int? maxParticipants,
    String? password,
    bool requiresApproval = false,
    bool waitingRoomEnabled = false,
    bool allowJoinBeforeHost = true,
    bool muteOnEntry = false,
    List<String> invitedEmails = const [],
    bool isRecurring = false,
    RecurrencePattern? recurrencePattern,
  }) async {
    try {
      final requestData = <String, dynamic>{
        'title': title,
        'description': description,
        'scheduled_at': scheduledAt.toUtc().toIso8601String(),
        'duration_minutes': durationMinutes,
        'requires_approval': requiresApproval,
        'waiting_room_enabled': waitingRoomEnabled,
        'allow_join_before_host': allowJoinBeforeHost,
        'mute_on_entry': muteOnEntry,
        'invited_emails': invitedEmails,
        'is_recurring': isRecurring,
      };

      if (maxParticipants != null) requestData['max_participants'] = maxParticipants;
      if (password != null) requestData['password'] = password;
      if (recurrencePattern != null) {
        requestData['recurrence_pattern'] = RecurrencePatternModel.fromDomain(recurrencePattern).toJson();
      }

      final response = await client.post(
        '/scheduled-meetings',
        data: requestData,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ScheduledMeetingModel.fromJson(response.data['meeting'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to create scheduled meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      throw ServerException(message: e.response?.data['error'] ?? e.message ?? 'Network error');
    }
  }

  @override
  Future<ScheduledMeetingModel> updateScheduledMeeting({
    required String id,
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? durationMinutes,
    int? maxParticipants,
    String? password,
    bool? requiresApproval,
    bool? waitingRoomEnabled,
    bool? allowJoinBeforeHost,
    bool? muteOnEntry,
    List<String>? invitedEmails,
  }) async {
    try {
      final requestData = <String, dynamic>{};
      if (title != null) requestData['title'] = title;
      if (description != null) requestData['description'] = description;
      if (scheduledAt != null) requestData['scheduled_at'] = scheduledAt.toUtc().toIso8601String();
      if (durationMinutes != null) requestData['duration_minutes'] = durationMinutes;
      if (maxParticipants != null) requestData['max_participants'] = maxParticipants;
      if (password != null) requestData['password'] = password;
      if (requiresApproval != null) requestData['requires_approval'] = requiresApproval;
      if (waitingRoomEnabled != null) requestData['waiting_room_enabled'] = waitingRoomEnabled;
      if (allowJoinBeforeHost != null) requestData['allow_join_before_host'] = allowJoinBeforeHost;
      if (muteOnEntry != null) requestData['mute_on_entry'] = muteOnEntry;
      if (invitedEmails != null) requestData['invited_emails'] = invitedEmails;

      final response = await client.put(
        '/scheduled-meetings/$id',
        data: requestData,
      );

      if (response.statusCode == 200) {
        return ScheduledMeetingModel.fromJson(response.data['meeting'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to update scheduled meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Scheduled meeting not found');
      }
      throw ServerException(message: e.response?.data['error'] ?? e.message ?? 'Network error');
    }
  }

  @override
  Future<void> deleteScheduledMeeting(String id) async {
    try {
      final response = await client.delete('/scheduled-meetings/$id');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw const ServerException(message: 'Failed to delete scheduled meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Scheduled meeting not found');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<String> startScheduledMeeting(String id) async {
    try {
      final response = await client.post('/scheduled-meetings/$id/start');

      if (response.statusCode == 200) {
        return response.data['room_id'] as String;
      } else {
        throw const ServerException(message: 'Failed to start scheduled meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      if (e.response?.statusCode == 404) {
        throw const ServerException(message: 'Scheduled meeting not found');
      }
      throw ServerException(message: e.response?.data['error'] ?? e.message ?? 'Network error');
    }
  }

  @override
  Future<List<ScheduledMeetingModel>> getUpcomingScheduledMeetings({
    int? limit,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;

      final response = await client.get(
        '/scheduled-meetings/upcoming',
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['meetings'] ?? [];
        return data.map((json) => ScheduledMeetingModel.fromJson(json)).toList();
      } else {
        throw const ServerException(message: 'Failed to get upcoming scheduled meetings');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      // Return empty list if endpoint not implemented
      return [];
    }
  }
}
