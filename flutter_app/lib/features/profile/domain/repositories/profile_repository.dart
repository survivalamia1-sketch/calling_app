import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user.dart';
import '../entities/profile_update.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> updateProfile(ProfileUpdate profileUpdate);
  Future<Either<Failure, Unit>> changePassword(PasswordChange passwordChange);
  Future<Either<Failure, User>> getProfile();
}
