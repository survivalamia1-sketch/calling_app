import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../constants/api_constants.dart';
import '../network/network_info.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/register.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/meetings/data/datasources/meetings_remote_data_source.dart';
import '../../features/meetings/data/repositories/meetings_repository_impl.dart';
import '../../features/meetings/domain/repositories/meetings_repository.dart';
import '../../features/meetings/domain/usecases/create_meeting.dart';
import '../../features/meetings/domain/usecases/get_meetings.dart';
import '../../features/meetings/domain/usecases/join_meeting.dart';
import '../../features/meetings/presentation/bloc/meetings_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Core
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt()),
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
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Add auth token to requests
            final storage = getIt<FlutterSecureStorage>();
            final token = await storage.read(key: 'auth_token');
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
          onError: (error, handler) async {
            // Handle 401 errors globally
            if (error.response?.statusCode == 401) {
              // Token expired or invalid - clear local data
              final storage = getIt<FlutterSecureStorage>();
              await storage.delete(key: 'auth_token');
              await storage.delete(key: 'cached_user');
            }
            return handler.next(error);
          },
        ),
      ),
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

  // Subscriptions Feature
  // - SubscriptionsRemoteDataSource
  // - SubscriptionsRepository
  // - SubscriptionsBloc

  // Call Feature
  // - WebRTCService
  // - SignalingService
  // - CallBloc

  // Profile Feature
  // - ProfileRepository
  // - ProfileBloc

  // Settings Feature
  // - SettingsRepository
  // - SettingsBloc
}
