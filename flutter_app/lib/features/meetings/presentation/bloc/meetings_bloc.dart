import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_meeting.dart';
import '../../domain/usecases/get_meetings.dart';
import '../../domain/usecases/join_meeting.dart';
import 'meetings_event.dart';
import 'meetings_state.dart';

class MeetingsBloc extends Bloc<MeetingsEvent, MeetingsState> {
  final GetMeetings getMeetingsUseCase;
  final CreateMeeting createMeetingUseCase;
  final JoinMeeting joinMeetingUseCase;

  MeetingsBloc({
    required this.getMeetingsUseCase,
    required this.createMeetingUseCase,
    required this.joinMeetingUseCase,
  }) : super(const MeetingsState.initial()) {
    on<_LoadMeetings>(_onLoadMeetings);
    on<_CreateMeeting>(_onCreateMeeting);
    on<_JoinMeeting>(_onJoinMeeting);
    on<_RefreshMeetings>(_onRefreshMeetings);
  }

  Future<void> _onLoadMeetings(
    _LoadMeetings event,
    Emitter<MeetingsState> emit,
  ) async {
    emit(const MeetingsState.loading());

    final result = await getMeetingsUseCase(GetMeetingsParams(
      status: event.status,
    ));

    result.fold(
      (failure) => emit(MeetingsState.error(failure)),
      (meetings) => emit(MeetingsState.loaded(meetings: meetings)),
    );
  }

  Future<void> _onCreateMeeting(
    _CreateMeeting event,
    Emitter<MeetingsState> emit,
  ) async {
    emit(const MeetingsState.loading());

    final result = await createMeetingUseCase(CreateMeetingParams(
      title: event.title,
      description: event.description,
      scheduledAt: event.scheduledAt,
      duration: event.duration,
      maxParticipants: event.maxParticipants,
      requiresApproval: event.requiresApproval,
    ));

    result.fold(
      (failure) => emit(MeetingsState.error(failure)),
      (meeting) {
        emit(MeetingsState.meetingCreated(meeting: meeting));
        // Reload meetings after creation
        add(const MeetingsEvent.refreshMeetings());
      },
    );
  }

  Future<void> _onJoinMeeting(
    _JoinMeeting event,
    Emitter<MeetingsState> emit,
  ) async {
    emit(const MeetingsState.loading());

    final result = await joinMeetingUseCase(JoinMeetingParams(
      roomCode: event.roomCode,
    ));

    result.fold(
      (failure) => emit(MeetingsState.error(failure)),
      (roomId) => emit(MeetingsState.joinedMeeting(roomId: roomId)),
    );
  }

  Future<void> _onRefreshMeetings(
    _RefreshMeetings event,
    Emitter<MeetingsState> emit,
  ) async {
    final result = await getMeetingsUseCase(const GetMeetingsParams());

    result.fold(
      (failure) => emit(MeetingsState.error(failure)),
      (meetings) => emit(MeetingsState.loaded(meetings: meetings)),
    );
  }
}
