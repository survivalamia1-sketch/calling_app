import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/settings_repository.dart';

class ResetSettings implements UseCase<Unit, NoParams> {
  final SettingsRepository repository;

  ResetSettings(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.resetSettings();
  }
}
