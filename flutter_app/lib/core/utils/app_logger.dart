import 'package:logger/logger.dart';

/// Singleton App Logger
///
/// Usage:
/// ```dart
/// AppLogger.d('Debug message');
/// AppLogger.i('Info message');
/// AppLogger.w('Warning message');
/// AppLogger.e('Error message', error: error, stackTrace: stackTrace);
/// ```
class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTime,
    ),
  );

  static final Logger _simpleLogger = Logger(
    printer: SimplePrinter(),
  );

  /// Debug log - for development debugging
  static void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Info log - for general information
  static void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Warning log - for potential issues
  static void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Error log - for errors
  static void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Simple log without formatting - for simple output
  static void simple(dynamic message) {
    _simpleLogger.i(message);
  }

  /// Log API request
  static void apiRequest(String method, String url,
      {Map<String, dynamic>? data}) {
    _logger.i('🌐 API Request: $method $url', time: DateTime.now());
    if (data != null && data.isNotEmpty) {
      // Mask sensitive data
      final maskedData = _maskSensitiveData(data);
      _logger.d('📤 Request Data: $maskedData');
    }
  }

  /// Log API response
  static void apiResponse(String method, String url, int statusCode,
      {dynamic data}) {
    final emoji = statusCode >= 200 && statusCode < 300 ? '✅' : '❌';
    _logger.i('$emoji API Response: $method $url - Status: $statusCode',
        time: DateTime.now());
    if (data != null) {
      _logger.d('📥 Response Data: $data');
    }
  }

  /// Log API error
  static void apiError(String method, String url, Object error,
      {StackTrace? stackTrace}) {
    _logger.e(
      '❌ API Error: $method $url',
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log BLoC event
  static void blocEvent(String blocName, dynamic event) {
    _logger.i('🎯 [$blocName] Event: $event', time: DateTime.now());
  }

  /// Log BLoC state
  static void blocState(String blocName, dynamic state) {
    _logger.i('📊 [$blocName] State: $state', time: DateTime.now());
  }

  /// Log navigation
  static void navigation(String from, String to) {
    _logger.i('🧭 Navigation: $from → $to', time: DateTime.now());
  }

  /// Log use case execution
  static void useCase(String useCaseName, {Map<String, dynamic>? params}) {
    _logger.i('⚙️  UseCase: $useCaseName', time: DateTime.now());
    if (params != null && params.isNotEmpty) {
      final maskedParams = _maskSensitiveData(params);
      _logger.d('   Params: $maskedParams');
    }
  }

  /// Log repository call
  static void repository(String repositoryName, String method,
      {Map<String, dynamic>? params}) {
    _logger.i('💾 Repository: $repositoryName.$method', time: DateTime.now());
    if (params != null && params.isNotEmpty) {
      final maskedParams = _maskSensitiveData(params);
      _logger.d('   Params: $maskedParams');
    }
  }

  /// Log data source call
  static void dataSource(String dataSourceName, String method,
      {Map<String, dynamic>? params}) {
    _logger.i('🗄️  DataSource: $dataSourceName.$method', time: DateTime.now());
    if (params != null && params.isNotEmpty) {
      final maskedParams = _maskSensitiveData(params);
      _logger.d('   Params: $maskedParams');
    }
  }

  /// Mask sensitive data in logs
  static Map<String, dynamic> _maskSensitiveData(Map<String, dynamic> data) {
    final masked = Map<String, dynamic>.from(data);
    final sensitiveKeys = [
      'password',
      'token',
      'secret',
      'api_key',
      'authorization'
    ];

    masked.forEach((key, value) {
      if (sensitiveKeys
          .any((sensitiveKey) => key.toLowerCase().contains(sensitiveKey))) {
        masked[key] = '***MASKED***';
      } else if (value is Map<String, dynamic>) {
        masked[key] = _maskSensitiveData(value);
      }
    });

    return masked;
  }
}

/// Extension for easier logging in classes
extension LoggerExtension on Object {
  void logDebug(String message) {
    AppLogger.d('[$runtimeType] $message');
  }

  void logInfo(String message) {
    AppLogger.i('[$runtimeType] $message');
  }

  void logWarning(String message, {Object? error}) {
    AppLogger.w('[$runtimeType] $message', error: error);
  }

  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    AppLogger.e('[$runtimeType] $message',
        error: error, stackTrace: stackTrace);
  }
}
