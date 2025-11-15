import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_data_source.dart';
import '../models/settings_model.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Settings>> getSettings() async {
    try {
      final settingsModel = await localDataSource.getSettings();
      return Right(settingsModel.toDomain());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return const Left(CacheFailure(message: 'Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateSettings(Settings settings) async {
    try {
      final settingsModel = SettingsModel.fromDomain(settings);
      await localDataSource.cacheSettings(settingsModel);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return const Left(CacheFailure(message: 'Failed to update settings'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetSettings() async {
    try {
      await localDataSource.clearSettings();
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return const Left(CacheFailure(message: 'Failed to reset settings'));
    }
  }
}
