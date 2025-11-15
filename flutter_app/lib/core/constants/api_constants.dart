class ApiConstants {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080/api/v1',
  );

  static const String wsUrl = String.fromEnvironment(
    'WS_URL',
    defaultValue: 'ws://localhost:8080/ws',
  );

  // Endpoints
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authMe = '/auth/me';
  static const String authForgotPassword = '/auth/forgot-password';
  static const String authResetPassword = '/auth/reset-password';
  static const String authResendVerification = '/auth/resend-verification';
  static const String authChangePassword = '/auth/change-password';

  static const String usersMe = '/users/me';
  static const String usersMeSubscription = '/users/me/subscription';

  static const String rooms = '/rooms';
  static String roomById(String id) => '/rooms/$id';
  static String roomJoin(String id) => '/rooms/$id/join';
  static const String roomsJoinByCode = '/rooms/join-by-code';
  static const String roomsMine = '/rooms/mine';
  static const String roomsUpcoming = '/rooms/upcoming';

  static const String subscriptionsPlans = '/subscriptions/plans';
  static const String subscriptionsCheckout =
      '/subscriptions/create-checkout-session';
  static const String subscriptionsCancel = '/subscriptions/cancel';
  static const String subscriptionsMe = '/subscriptions/me';
  static const String supportTickets = '/support/tickets';
}
