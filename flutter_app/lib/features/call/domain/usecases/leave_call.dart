import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/call_repository.dart';

class LeaveCall implements UseCase<Unit, NoParams> {
  final CallRepository repository;

  LeaveCall(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.leaveCall();
  }
}
