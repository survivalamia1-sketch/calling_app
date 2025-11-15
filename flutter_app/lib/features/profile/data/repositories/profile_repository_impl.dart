import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/entities/profile_update.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import '../models/profile_update_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> updateProfile(
      ProfileUpdate profileUpdate) async {
    if (await networkInfo.isConnected) {
      try {
        final profileUpdateModel = ProfileUpdateModel.fromDomain(profileUpdate);
        final userModel =
            await remoteDataSource.updateProfile(profileUpdateModel);
        return Right(userModel.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword(
      PasswordChange passwordChange) async {
    if (await networkInfo.isConnected) {
      try {
        final passwordChangeModel =
            PasswordChangeModel.fromDomain(passwordChange);
        await remoteDataSource.changePassword(passwordChangeModel);
        return const Right(unit);
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }

  @override
  Future<Either<Failure, User>> getProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.getProfile();
        return Right(userModel.toDomain());
      } on UnauthorizedException {
        return const Left(UnauthorizedFailure(message: 'Unauthorized'));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'Network error'));
    }
  }
}
