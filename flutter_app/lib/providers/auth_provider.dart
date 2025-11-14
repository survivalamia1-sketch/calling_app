import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final AuthService _authService = AuthService();

  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  Future<void> checkAuth() async {
    try {
      final isAuth = await _authService.isAuthenticated();
      if (isAuth) {
        await loadUser();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> loadUser() async {
    try {
      _isLoading = true;
      notifyListeners();

      _user = await _apiService.getMe();
      _error = null;
    } catch (e) {
      _error = e.toString();
      _user = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.login(email, password);

      await _authService.saveToken(response['token']);
      if (response['refresh_token'] != null) {
        await _authService.saveRefreshToken(response['refresh_token']);
      }

      _user = User.fromJson(response['user']);
      await _authService.saveUserData(response['user']);

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.register(email, password, firstName, lastName);

      // If auto-login after registration
      if (response['token'] != null) {
        await _authService.saveToken(response['token']);
        _user = User.fromJson(response['user']);
        await _authService.saveUserData(response['user']);
      }

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.clearAll();
    _user = null;
    _error = null;
    notifyListeners();
  }

  Future<bool> forgotPassword(String email) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.forgotPassword(email);

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> resendVerificationEmail() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.resendVerificationEmail();

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> updates) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.updateProfile(updates);
      await loadUser();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.changePassword(oldPassword, newPassword);

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
