import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getLastUser();
  Future<void> cacheToken(String token);
  Future<String> getToken();
  Future<void> cacheRefreshToken(String refreshToken);
  Future<String?> getRefreshToken();
  Future<void> clearAuth();
  Future<bool> hasToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage storage;

  AuthLocalDataSourceImpl({required this.storage});

  @override
  Future<void> cacheUser(UserModel user) async {
    await storage.write(
      key: AppConstants.userDataKey,
      value: jsonEncode(user.toJson()),
    );
  }

  @override
  Future<UserModel> getLastUser() async {
    final jsonString = await storage.read(key: AppConstants.userDataKey);
    if (jsonString != null) {
      return UserModel.fromJson(jsonDecode(jsonString));
    }
    throw const CacheException(message: 'No user found in cache');
  }

  @override
  Future<void> cacheToken(String token) async {
    await storage.write(key: AppConstants.authTokenKey, value: token);
  }

  @override
  Future<String> getToken() async {
    final token = await storage.read(key: AppConstants.authTokenKey);
    if (token != null) {
      return token;
    }
    throw const CacheException(message: 'No token found');
  }

  @override
  Future<void> cacheRefreshToken(String refreshToken) async {
    await storage.write(key: AppConstants.refreshTokenKey, value: refreshToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await storage.read(key: AppConstants.refreshTokenKey);
  }

  @override
  Future<void> clearAuth() async {
    await storage.delete(key: AppConstants.authTokenKey);
    await storage.delete(key: AppConstants.refreshTokenKey);
    await storage.delete(key: AppConstants.userDataKey);
  }

  @override
  Future<bool> hasToken() async {
    final token = await storage.read(key: AppConstants.authTokenKey);
    return token != null && token.isNotEmpty;
  }
}
