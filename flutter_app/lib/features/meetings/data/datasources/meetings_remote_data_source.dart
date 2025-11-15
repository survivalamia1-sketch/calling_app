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
        final List<dynamic> data = response.data['rooms'] ?? response.data;
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
        return MeetingModel.fromJson(response.data['room']);
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
    try {
      final response = await client.get(
        ApiConstants.roomsJoinByCode,
        queryParameters: {'code': code},
      );

      if (response.statusCode == 200) {
        return MeetingModel.fromJson(response.data['room']);
      } else {
        throw const ServerException(message: 'Failed to find meeting');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw const ServerException(
            message: 'Meeting not found with this code');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
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
          'title': title,
          'description': description,
          'scheduled_at': scheduledAt.toIso8601String(),
          if (duration != null) 'duration': duration,
          if (maxParticipants != null) 'max_participants': maxParticipants,
          if (requiresApproval != null) 'requires_approval': requiresApproval,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return MeetingModel.fromJson(response.data['room']);
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
    try {
      final data = <String, dynamic>{};
      if (title != null) data['title'] = title;
      if (description != null) data['description'] = description;
      if (scheduledAt != null) {
        data['scheduled_at'] = scheduledAt.toIso8601String();
      }
      if (duration != null) data['duration'] = duration;
      if (maxParticipants != null) data['max_participants'] = maxParticipants;
      if (requiresApproval != null) {
        data['requires_approval'] = requiresApproval;
      }

      final response = await client.put(
        '${ApiConstants.rooms}/$id',
        data: data,
      );

      if (response.statusCode == 200) {
        return MeetingModel.fromJson(response.data['room']);
      } else {
        throw const ServerException(message: 'Failed to update meeting');
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
      final response = await client.post(
        ApiConstants.roomJoin(roomCode),
        data: {'room_code': roomCode},
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
      final response = await client.post(
        ApiConstants.roomById(roomId),
        data: {'room_id': roomId},
      );

      if (response.statusCode != 200) {
        throw const ServerException(message: 'Failed to leave meeting');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }
}
