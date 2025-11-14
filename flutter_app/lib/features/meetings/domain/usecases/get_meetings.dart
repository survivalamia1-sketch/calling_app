import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/meeting.dart';
import '../repositories/meetings_repository.dart';

class GetMeetings implements UseCase<List<Meeting>, GetMeetingsParams> {
  final MeetingsRepository repository;

  GetMeetings(this.repository);

  @override
  Future<Either<Failure, List<Meeting>>> call(GetMeetingsParams params) async {
    return await repository.getMeetings(
      status: params.status,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class GetMeetingsParams extends Equatable {
  final String? status;
  final int? limit;
  final int? offset;

  const GetMeetingsParams({
    this.status,
    this.limit,
    this.offset,
  });

  @override
  List<Object?> get props => [status, limit, offset];
}
