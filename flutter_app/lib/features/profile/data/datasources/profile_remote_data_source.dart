import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../auth/data/models/user_model.dart';
import '../models/profile_update_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> updateProfile(ProfileUpdateModel profileUpdate);
  Future<void> changePassword(PasswordChangeModel passwordChange);
  Future<UserModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio client;

  ProfileRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> updateProfile(ProfileUpdateModel profileUpdate) async {
    try {
      final response = await client.put(
        '/auth/profile',
        data: profileUpdate.toJson(),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerException(message: 'Failed to update profile');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      throw ServerException(
        message: e.response?.data?['error'] ?? 'Server error occurred',
      );
    } catch (e) {
      throw ServerException(message: 'Unexpected error occurred');
    }
  }

  @override
  Future<void> changePassword(PasswordChangeModel passwordChange) async {
    try {
      final response = await client.post(
        '/auth/change-password',
        data: passwordChange.toJson(),
      );

      if (response.statusCode != 200) {
        throw ServerException(message: 'Failed to change password');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      if (e.response?.statusCode == 400) {
        throw ServerException(
          message: e.response?.data?['error'] ?? 'Invalid password',
        );
      }
      throw ServerException(
        message: e.response?.data?['error'] ?? 'Server error occurred',
      );
    } catch (e) {
      throw ServerException(message: 'Unexpected error occurred');
    }
  }

  @override
  Future<UserModel> getProfile() async {
    try {
      final response = await client.get('/auth/profile');

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerException(message: 'Failed to get profile');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      throw ServerException(
        message: e.response?.data?['error'] ?? 'Server error occurred',
      );
    } catch (e) {
      throw ServerException(message: 'Unexpected error occurred');
    }
  }
}
