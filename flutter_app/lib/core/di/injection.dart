import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/register.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/call/data/repositories/call_repository_impl.dart';
import '../../features/call/data/services/signaling_service.dart';
import '../../features/call/data/services/webrtc_service.dart';
import '../../features/call/domain/repositories/call_repository.dart';
import '../../features/call/domain/usecases/join_call.dart';
import '../../features/call/domain/usecases/leave_call.dart';
import '../../features/call/domain/usecases/switch_camera.dart';
import '../../features/call/domain/usecases/toggle_audio.dart';
import '../../features/call/domain/usecases/toggle_video.dart';
import '../../features/call/presentation/bloc/call_bloc.dart';
import '../../features/home/data/datasources/dashboard_remote_data_source.dart';
import '../../features/home/data/repositories/dashboard_repository_impl.dart';
import '../../features/home/domain/repositories/dashboard_repository.dart';
import '../../features/home/domain/usecases/get_dashboard_stats.dart';
import '../../features/home/domain/usecases/get_upcoming_meetings.dart';
import '../../features/home/presentation/bloc/dashboard_bloc.dart';
import '../../features/meetings/data/datasources/meetings_remote_data_source.dart';
import '../../features/meetings/data/repositories/meetings_repository_impl.dart';
import '../../features/meetings/domain/repositories/meetings_repository.dart';
import '../../features/meetings/domain/usecases/create_meeting.dart';
import '../../features/meetings/domain/usecases/get_meetings.dart';
import '../../features/meetings/domain/usecases/join_meeting.dart';
import '../../features/meetings/presentation/bloc/meetings_bloc.dart';
import '../../features/profile/data/datasources/profile_remote_data_source.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/change_password.dart'
    as change_password;
import '../../features/profile/domain/usecases/update_profile.dart'
    as update_profile;
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/settings/data/datasources/settings_local_data_source.dart';
import '../../features/settings/data/models/settings_model.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../features/settings/domain/repositories/settings_repository.dart';
import '../../features/settings/domain/usecases/get_settings.dart';
import '../../features/settings/domain/usecases/reset_settings.dart';
import '../../features/settings/domain/usecases/update_settings.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/subscriptions/data/datasources/subscriptions_remote_data_source.dart';
import '../../features/subscriptions/data/repositories/subscriptions_repository_impl.dart';
import '../../features/subscriptions/domain/repositories/subscriptions_repository.dart';
import '../../features/subscriptions/domain/usecases/create_checkout_session.dart';
import '../../features/subscriptions/domain/usecases/get_current_subscription.dart';
import '../../features/subscriptions/domain/usecases/get_plans.dart';
import '../../features/subscriptions/presentation/bloc/subscriptions_bloc.dart';
import '../../features/support/data/datasources/support_remote_data_source.dart';
import '../../features/support/data/repositories/support_repository_impl.dart';
import '../../features/support/domain/repositories/support_repository.dart';
import '../../features/support/domain/usecases/get_faqs.dart';
import '../../features/support/domain/usecases/submit_bug_report.dart';
import '../../features/support/presentation/bloc/support_bloc.dart'
    hide SubmitBugReport;
import '../constants/api_constants.dart';
import '../network/network_info.dart';
import '../utils/app_logger.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Core
  // Only register InternetConnectionChecker on non-web platforms
  if (!kIsWeb) {
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }
  getIt.registerLazySingleton<NetworkInfo>(
    () {
      if (kIsWeb) {
        return NetworkInfoImpl(null);
      } else {
        return NetworkInfoImpl(getIt<InternetConnectionChecker>());
      }
    },
  );

  // External
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.addAll([
        // Logging interceptor
        InterceptorsWrapper(
          onRequest: (options, handler) {
            AppLogger.apiRequest(
              options.method,
              options.uri.toString(),
              data: options.data is Map<String, dynamic>
                  ? options.data as Map<String, dynamic>
                  : null,
            );
            return handler.next(options);
          },
          onResponse: (response, handler) {
            AppLogger.apiResponse(
              response.requestOptions.method,
              response.requestOptions.uri.toString(),
              response.statusCode ?? 0,
              data: response.data,
            );
            return handler.next(response);
          },
          onError: (error, handler) {
            AppLogger.apiError(
              error.requestOptions.method,
              error.requestOptions.uri.toString(),
              error,
              stackTrace: error.stackTrace,
            );
            return handler.next(error);
          },
        ),
        // Auth token interceptor
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Add auth token to requests
            final storage = getIt<FlutterSecureStorage>();
            final token = await storage.read(key: 'auth_token');
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
              AppLogger.d('🔑 Added auth token to request');
            }
            return handler.next(options);
          },
          onError: (error, handler) async {
            // Handle 401 errors globally
            if (error.response?.statusCode == 401) {
              AppLogger.w('🔒 Unauthorized - clearing auth data');
              // Token expired or invalid - clear local data
              final storage = getIt<FlutterSecureStorage>();
              await storage.delete(key: 'auth_token');
              await storage.delete(key: 'cached_user');
            }
            return handler.next(error);
          },
        ),
      ]),
  );

  // ===========================
  // Auth Feature
  // ===========================

  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => Login(getIt()));
  getIt.registerLazySingleton(() => Register(getIt()));
  getIt.registerLazySingleton(() => Logout(getIt()));
  getIt.registerLazySingleton(() => GetCurrentUser(getIt()));

  // Bloc
  getIt.registerFactory(
    () => AuthBloc(
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      logoutUseCase: getIt(),
      getCurrentUserUseCase: getIt(),
      repository: getIt(),
    ),
  );

  // ===========================
  // Meetings Feature
  // ===========================

  // Data sources
  getIt.registerLazySingleton<MeetingsRemoteDataSource>(
    () => MeetingsRemoteDataSourceImpl(client: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<MeetingsRepository>(
    () => MeetingsRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetMeetings(getIt()));
  getIt.registerLazySingleton(() => CreateMeeting(getIt()));
  getIt.registerLazySingleton(() => JoinMeeting(getIt()));

  // Bloc
  getIt.registerFactory(
    () => MeetingsBloc(
      getMeetingsUseCase: getIt(),
      createMeetingUseCase: getIt(),
      joinMeetingUseCase: getIt(),
    ),
  );

  // ===========================
  // Subscriptions Feature
  // ===========================

  // Data sources
  getIt.registerLazySingleton<SubscriptionsRemoteDataSource>(
    () => SubscriptionsRemoteDataSourceImpl(client: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<SubscriptionsRepository>(
    () => SubscriptionsRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPlans(getIt()));
  getIt.registerLazySingleton(() => GetCurrentSubscription(getIt()));
  getIt.registerLazySingleton(() => CreateCheckoutSession(getIt()));

  // Bloc
  getIt.registerFactory(
    () => SubscriptionsBloc(
      getPlansUseCase: getIt(),
      getCurrentSubscriptionUseCase: getIt(),
      createCheckoutSessionUseCase: getIt(),
    ),
  );

  // ===========================
  // Home/Dashboard Feature
  // ===========================

  // Data sources
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(client: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetDashboardStats(getIt()));
  getIt.registerLazySingleton(() => GetUpcomingMeetings(getIt()));

  // Bloc
  getIt.registerFactory(
    () => DashboardBloc(
      getDashboardStats: getIt(),
      getUpcomingMeetings: getIt(),
    ),
  );

  // ===========================
  // Settings Feature
  // ===========================

  // Initialize Hive box for settings (must be done before registering)
  final settingsBox = await Hive.openBox<SettingsModel>(SETTINGS_BOX);

  // Data sources
  getIt.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(settingsBox: settingsBox),
  );

  // Repository
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      localDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetSettings(getIt()));
  getIt.registerLazySingleton(() => UpdateSettings(getIt()));
  getIt.registerLazySingleton(() => ResetSettings(getIt()));

  // Bloc
  getIt.registerFactory(
    () => SettingsBloc(
      getSettings: getIt(),
      updateSettings: getIt(),
      resetSettings: getIt(),
    ),
  );

  // ===========================
  // Profile Feature
  // ===========================

  // Data sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(client: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => update_profile.UpdateProfile(getIt()));
  getIt.registerLazySingleton(() => change_password.ChangePassword(getIt()));

  // Bloc
  getIt.registerFactory(
    () => ProfileBloc(
      updateProfile: getIt(),
      changePassword: getIt(),
    ),
  );

  // ===========================
  // Support Feature
  // ===========================

  // Data sources
  getIt.registerLazySingleton<SupportRemoteDataSource>(
    () => SupportRemoteDataSourceImpl(client: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<SupportRepository>(
    () => SupportRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetFAQs(getIt()));
  getIt.registerLazySingleton(() => SubmitBugReport(getIt()));

  // Bloc
  getIt.registerFactory(
    () => SupportBloc(
      getFAQs: getIt(),
      submitBugReport: getIt(),
    ),
  );

  // ===========================
  // Call Feature
  // ===========================

  // Services
  getIt.registerLazySingleton(() => WebRTCService());
  getIt.registerLazySingleton(() => SignalingService());

  // Repository
  getIt.registerLazySingleton<CallRepository>(
    () => CallRepositoryImpl(
      webrtcService: getIt(),
      signalingService: getIt(),
      storage: getIt(),
      dio: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => JoinCall(getIt()));
  getIt.registerLazySingleton(() => LeaveCall(getIt()));
  getIt.registerLazySingleton(() => ToggleAudio(getIt()));
  getIt.registerLazySingleton(() => ToggleVideo(getIt()));
  getIt.registerLazySingleton(() => SwitchCamera(getIt()));

  // Bloc
  getIt.registerFactory(
    () => CallBloc(
      joinCall: getIt(),
      leaveCall: getIt(),
      toggleAudio: getIt(),
      toggleVideo: getIt(),
      switchCamera: getIt(),
      repository: getIt(),
      webrtcService: getIt(),
    ),
  );
}
