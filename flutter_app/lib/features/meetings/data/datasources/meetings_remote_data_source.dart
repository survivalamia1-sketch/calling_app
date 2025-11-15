import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/meeting_model.dart';

abstract class MeetingsRemoteDataSource {
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
      final response = await client.post(
        ApiConstants.rooms,
        data: {
          'name': title, // Backend expects 'name', not 'title'
          'description': description,
          'scheduled_at': scheduledAt.toIso8601String(),
          if (maxParticipants != null) 'max_participants': maxParticipants,
          if (requiresApproval != null)
            'has_waiting_room':
                requiresApproval, // Backend uses 'has_waiting_room'
          'is_password_locked': false, // Default
          'password': '', // Default empty
        },
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
        throw ServerException(
            message: e.response?.data['message'] ?? 'Invalid meeting data');
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
}
