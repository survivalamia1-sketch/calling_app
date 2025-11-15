import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  Future<UserModel> getCurrentUser();

  Future<void> forgotPassword({required String email});

  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });

  Future<void> resendVerificationEmail();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<UserModel> updateProfile(Map<String, dynamic> updates);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    AppLogger.dataSource('AuthRemoteDataSource', 'login', params: {'email': email});

    try {
      final response = await client.post(
        ApiConstants.authLogin,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        AppLogger.i('✅ Login successful for: $email');
        return {
          'user': UserModel.fromJson(response.data['user']),
          'token': response.data['token'] as String,
          'refresh_token': response.data['refresh_token'] as String?,
        };
      } else {
        final error = response.data['message'] ?? 'Login failed';
        AppLogger.w('⚠️ Login failed: $error');
        throw ServerException(message: error);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final message = e.response?.data['error'] ?? e.response?.data['message'] ?? 'Invalid credentials';
        AppLogger.w('🔒 Login unauthorized: $message');
        throw UnauthorizedException(message: message);
      } else if (e.response?.statusCode == 403) {
        final message = e.response?.data['error'] ?? e.response?.data['message'] ?? '';
        AppLogger.w('🚫 Login forbidden: $message');
        if (message.toLowerCase().contains('not verified')) {
          throw UnauthorizedException(message: message);
        }
        throw UnauthorizedException(message: message);
      }
      AppLogger.e('❌ Login error', error: e);
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    AppLogger.dataSource('AuthRemoteDataSource', 'register', params: {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    });

    try {
      final response = await client.post(
        ApiConstants.authRegister,
        data: {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        AppLogger.i('✅ Registration successful for: $email');
        return {
          'user': UserModel.fromJson(response.data['user']),
          'token': response.data['token'] as String?,
          'requires_verification':
              response.data['requires_email_verification'] ?? true,
        };
      } else {
        final error = response.data['error'] ?? response.data['message'] ?? 'Registration failed';
        AppLogger.w('⚠️ Registration failed: $error');
        throw ServerException(message: error);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errorMsg = e.response?.data['error'] ?? e.response?.data['message'] ?? 'Invalid data';
        final fields = e.response?.data['fields'];

        if (fields != null) {
          AppLogger.w('⚠️ Registration validation failed: $fields');
          throw ServerException(message: 'Validation failed: $fields');
        }

        AppLogger.w('⚠️ Registration bad request: $errorMsg');
        throw ServerException(message: errorMsg);
      }
      AppLogger.e('❌ Registration error', error: e);
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await client.get(ApiConstants.authProfile);

      if (response.statusCode == 200) {
        // Backend returns user directly, not wrapped
        return UserModel.fromJson(response.data['user'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to get user');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Unauthorized');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      final response = await client.post(
        ApiConstants.authForgotPassword,
        data: {'email': email},
      );

      if (response.statusCode != 200) {
        throw const ServerException(message: 'Failed to send reset email');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      final response = await client.post(
        ApiConstants.authResetPassword,
        data: {
          'token': token,
          'new_password': newPassword,
        },
      );

      if (response.statusCode != 200) {
        throw const ServerException(message: 'Failed to reset password');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> resendVerificationEmail() async {
    // Note: Resend verification endpoint not available in backend
    throw const ServerException(message: 'Resend verification not implemented');
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final response = await client.post(
        ApiConstants.authChangePassword,
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
        },
      );

      if (response.statusCode != 200) {
        throw const ServerException(message: 'Failed to change password');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw ServerException(
            message: e.response?.data['message'] ?? 'Invalid password');
      }
      throw ServerException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<UserModel> updateProfile(Map<String, dynamic> updates) async {
    try {
      final response = await client.put(
        ApiConstants.authProfile,
        data: updates,
      );

      if (response.statusCode == 200) {
        // Backend returns user directly, not wrapped
        return UserModel.fromJson(response.data['user'] ?? response.data);
      } else {
        throw const ServerException(message: 'Failed to update profile');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }
}
