import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/settings.dart';
import '../repositories/settings_repository.dart';

class UpdateSettings implements UseCase<Unit, UpdateSettingsParams> {
  final SettingsRepository repository;

  UpdateSettings(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateSettingsParams params) async {
    return await repository.updateSettings(params.settings);
  }
}

class UpdateSettingsParams extends Equatable {
  final Settings settings;

  const UpdateSettingsParams({required this.settings});

  @override
  List<Object?> get props => [settings];
}
