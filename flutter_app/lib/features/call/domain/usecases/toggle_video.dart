import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/call_repository.dart';

class ToggleVideo implements UseCase<Unit, ToggleVideoParams> {
  final CallRepository repository;

  ToggleVideo(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ToggleVideoParams params) async {
    return await repository.toggleVideo(params.enable);
  }
}

class ToggleVideoParams extends Equatable {
  final bool enable;

  const ToggleVideoParams({required this.enable});

  @override
  List<Object?> get props => [enable];
}
