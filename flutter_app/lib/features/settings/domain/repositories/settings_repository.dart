import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/settings.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Settings>> getSettings();
  Future<Either<Failure, Unit>> updateSettings(Settings settings);
  Future<Either<Failure, Unit>> resetSettings();
}
