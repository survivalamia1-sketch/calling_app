import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/meeting.dart';
import '../repositories/meetings_repository.dart';

class CreateMeeting implements UseCase<Meeting, CreateMeetingParams> {
  final MeetingsRepository repository;

  CreateMeeting(this.repository);

  @override
  Future<Either<Failure, Meeting>> call(CreateMeetingParams params) async {
    return await repository.createMeeting(
      title: params.title,
      description: params.description,
      scheduledAt: params.scheduledAt,
      duration: params.duration,
      maxParticipants: params.maxParticipants,
      requiresApproval: params.requiresApproval,
    );
  }
}

class CreateMeetingParams extends Equatable {
  final String title;
  final String description;
  final DateTime scheduledAt;
  final int? duration;
  final int? maxParticipants;
  final bool? requiresApproval;

  const CreateMeetingParams({
    required this.title,
    required this.description,
    required this.scheduledAt,
    this.duration,
    this.maxParticipants,
    this.requiresApproval,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        scheduledAt,
        duration,
        maxParticipants,
        requiresApproval,
      ];
}
