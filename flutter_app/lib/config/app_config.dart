class AppConfig {
  static const String appName = 'Calling App';
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080/api/v1',
  );

  static const String wsUrl = String.fromEnvironment(
    'WS_URL',
    defaultValue: 'ws://localhost:8080/ws',
  );

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
}
