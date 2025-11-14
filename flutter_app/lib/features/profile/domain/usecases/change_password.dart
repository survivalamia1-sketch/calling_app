import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/profile_update.dart';
import '../repositories/profile_repository.dart';

class ChangePassword implements UseCase<Unit, ChangePasswordParams> {
  final ProfileRepository repository;

  ChangePassword(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) async {
    return await repository.changePassword(params.passwordChange);
  }
}

class ChangePasswordParams extends Equatable {
  final PasswordChange passwordChange;

  const ChangePasswordParams({required this.passwordChange});

  @override
  List<Object?> get props => [passwordChange];
}
