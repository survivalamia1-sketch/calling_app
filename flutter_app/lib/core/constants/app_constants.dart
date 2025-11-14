class AppConstants {
  static const String appName = 'Calling App';

  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: '',
  );

  // App limits
  static const int freePlanMaxParticipants = 3;
  static const int freePlanMaxDuration = 40; // minutes
  static const int proPlanMaxParticipants = 50;
  static const int businessPlanMaxParticipants = 100;

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 10);

  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
}
