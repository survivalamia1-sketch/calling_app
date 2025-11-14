import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/call_repository.dart';

class ToggleAudio implements UseCase<Unit, ToggleAudioParams> {
  final CallRepository repository;

  ToggleAudio(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ToggleAudioParams params) async {
    return await repository.toggleAudio(params.enable);
  }
}

class ToggleAudioParams extends Equatable {
  final bool enable;

  const ToggleAudioParams({required this.enable});

  @override
  List<Object?> get props => [enable];
}
