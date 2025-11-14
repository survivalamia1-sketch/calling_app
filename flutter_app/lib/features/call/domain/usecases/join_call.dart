import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/call.dart';
import '../repositories/call_repository.dart';

class JoinCall implements UseCase<Call, JoinCallParams> {
  final CallRepository repository;

  JoinCall(this.repository);

  @override
  Future<Either<Failure, Call>> call(JoinCallParams params) async {
    // First initialize WebRTC
    final initResult = await repository.initialize();

    return initResult.fold(
      (failure) => Left(failure),
      (_) async {
        // Then join the call
        return await repository.joinCall(params.roomId);
      },
    );
  }
}

class JoinCallParams extends Equatable {
  final String roomId;

  const JoinCallParams({required this.roomId});

  @override
  List<Object?> get props => [roomId];
}
