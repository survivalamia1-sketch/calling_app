class ApiConstants {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080/api/v1',
  );

  static const String wsUrl = String.fromEnvironment(
    'WS_URL',
    defaultValue: 'ws://localhost:8080/api/v1/ws',
  );

  // Endpoints
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authProfile = '/auth/profile';
  static const String authForgotPassword = '/auth/forgot-password';
  static const String authResetPassword = '/auth/reset-password';
  static const String authRefresh = '/auth/refresh';
  static const String authChangePassword = '/auth/change-password';

  static const String rooms = '/rooms';
  static String roomById(String id) => '/rooms/$id';
  static String roomJoin(String id) => '/rooms/$id/join';
  static String roomParticipants(String id) => '/rooms/$id/participants';
  static String roomInfo(String id) => '/rooms/$id/info';
  static String roomStatus(String id) => '/rooms/$id/status';
  static String roomLeave(String id) => '/rooms/$id/leave';
  static String roomEnd(String id) => '/rooms/$id/end';

  static const String subscriptionsPlans = '/subscriptions/plans';
  static const String subscriptionsCheckout = '/subscriptions/checkout';
  static const String subscriptionsCancel = '/subscriptions/cancel';
  static const String subscriptionsCurrent = '/subscriptions/current';
}
