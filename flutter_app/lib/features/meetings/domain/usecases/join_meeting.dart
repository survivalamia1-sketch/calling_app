import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/meetings_repository.dart';

class JoinMeeting implements UseCase<String, JoinMeetingParams> {
  final MeetingsRepository repository;

  JoinMeeting(this.repository);

  @override
  Future<Either<Failure, String>> call(JoinMeetingParams params) async {
    return await repository.joinMeeting(params.roomCode);
  }
}

class JoinMeetingParams extends Equatable {
  final String roomCode;

  const JoinMeetingParams({required this.roomCode});

  @override
  List<Object?> get props => [roomCode];
}
