import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entities/call_connection_state.dart';
import '../../domain/repositories/meeting_connection_service.dart';
import '../../domain/repositories/meeting_media_service.dart';
import '../bloc/in_meeting_bloc.dart';
import '../bloc/in_meeting_event.dart';
import '../bloc/in_meeting_state.dart';
import '../widgets/audio_device_selector.dart';
import '../widgets/bottom_control_bar.dart';
import '../widgets/chat_panel.dart';
import '../widgets/layout_selector.dart';
import '../widgets/meeting_settings_dialog.dart';
import '../widgets/more_options_sheet.dart';
import '../widgets/participants_panel.dart';
import '../widgets/status_banner.dart';
import '../widgets/top_bar.dart';
import '../widgets/video_device_selector.dart';
import '../widgets/video_grid.dart';

/// Complete in-meeting page with all features
class InMeetingPage extends StatelessWidget {
  final String roomId;
  final String userId;
  final String displayName;
  final bool joinWithAudio;
  final bool joinWithVideo;
  final String? password;

  const InMeetingPage({
    super.key,
    required this.roomId,
    required this.userId,
    required this.displayName,
    this.joinWithAudio = true,
    this.joinWithVideo = true,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InMeetingBloc, InMeetingState>(
      listener: (context, state) {
        // Handle disconnection - navigate back
        if (state.connectionState == CallConnectionState.disconnected &&
            state.errorMessage == null) {
          Navigator.of(context).pop();
        }

        // Show error messages
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Dismiss',
                textColor: Colors.white,
                onPressed: () {
                  context.read<InMeetingBloc>().add(
                        const InMeetingEvent.clearError(),
                      );
                },
              ),
            ),
          );
        }
      },
      child: BlocBuilder<InMeetingBloc, InMeetingState>(
        builder: (context, state) {
          // Show loading screen while connecting
          if (state.connectionState == CallConnectionState.connecting) {
            return _buildLoadingScreen();
          }

          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Stack(
                children: [
                  // Main content area
                  Column(
                    children: [
                      // Status banner (if needed)
                      StatusBanner(
                        connectionState: state.connectionState,
                        errorMessage: state.errorMessage,
                      ),

                      // Video grid
                      Expanded(
                        child: Stack(
                          children: [
                            // Video participants
                            VideoGrid(
                              participants: state.participants,
                              layout: state.layout,
                              pinnedParticipant: state.pinnedParticipant,
                              activeSpeaker: state.activeSpeaker,
                            ),

                            // Top bar overlay
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: TopBar(
                                meetingInfo: state.meetingInfo,
                                networkQuality: state.networkQuality,
                                participantCount: state.participantCount,
                                isRecording: state.isRecording,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bottom control bar
                      BottomControlBar(
                        audioState: state.audioState,
                        videoState: state.videoState,
                        isScreenSharing: state.isScreenSharing,
                        unreadMessageCount: state.unreadMessageCount,
                        isHost: state.isHost,
                        onToggleAudio: () {
                          context.read<InMeetingBloc>().add(
                                const InMeetingEvent.toggleAudio(),
                              );
                        },
                        onToggleVideo: () {
                          context.read<InMeetingBloc>().add(
                                const InMeetingEvent.toggleVideo(),
                              );
                        },
                        onToggleScreenShare: () {
                          context.read<InMeetingBloc>().add(
                                const InMeetingEvent.toggleScreenShare(),
                              );
                        },
                        onOpenParticipants: () {
                          context.read<InMeetingBloc>().add(
                                const InMeetingEvent.toggleParticipantsPanel(),
                              );
                        },
                        onOpenChat: () {
                          context.read<InMeetingBloc>().add(
                                const InMeetingEvent.toggleChatPanel(),
                              );
                        },
                        onOpenLayout: () {
                          _showLayoutSelector(context, state);
                        },
                        onOpenMore: () {
                          _showMoreOptions(context, state);
                        },
                        onLeave: () {
                          _showLeaveConfirmation(context, state.isHost);
                        },
                      ),
                    ],
                  ),

                  // Side panels (desktop) or bottom sheets (mobile)
                  if (state.isParticipantsPanelOpen)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ParticipantsPanel(
                        participants: state.participants,
                        isHost: state.isHost,
                        onMuteParticipant: (participantId) {
                          context.read<InMeetingBloc>().add(
                                InMeetingEvent.muteParticipant(participantId),
                              );
                        },
                        onRemoveParticipant: (participantId) {
                          context.read<InMeetingBloc>().add(
                                InMeetingEvent.removeParticipant(participantId),
                              );
                        },
                        onPinParticipant: (participantId) {
                          context.read<InMeetingBloc>().add(
                                InMeetingEvent.pinParticipant(participantId),
                              );
                        },
                      ),
                    ),

                  if (state.isChatPanelOpen)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ChatPanel(
                        messages: state.messages,
                        isSending: state.isSendingMessage,
                        onSendMessage: (content) {
                          context.read<InMeetingBloc>().add(
                                InMeetingEvent.sendMessage(content),
                              );
                        },
                        onDeleteMessage: (messageId) {
                          context.read<InMeetingBloc>().add(
                                InMeetingEvent.deleteMessage(messageId),
                              );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.blue),
            SizedBox(height: 24),
            Text(
              'Joining meeting...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please wait',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLayoutSelector(BuildContext context, InMeetingState state) {
    final bloc = context.read<InMeetingBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => LayoutSelector(
        currentLayout: state.layout,
        onLayoutChanged: (layout) {
          bloc.add(InMeetingEvent.changeLayout(layout));
        },
      ),
    );
  }

  void _showMoreOptions(BuildContext context, InMeetingState state) {
    final bloc = context.read<InMeetingBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => MoreOptionsSheet(
        isHost: state.isHost,
        onSwitchCamera: () {
          bloc.add(const InMeetingEvent.switchCamera());
        },
        onSelectAudioDevice: () {
          showDialog(
            context: context,
            builder: (context) => AudioDeviceSelector(
              mediaService: getIt<MeetingMediaService>(),
            ),
          );
        },
        onSelectVideoDevice: () {
          showDialog(
            context: context,
            builder: (context) => VideoDeviceSelector(
              mediaService: getIt<MeetingMediaService>(),
            ),
          );
        },
        onSettings: () async {
          final connectionService = getIt<MeetingConnectionService>();
          final meetingInfo = await connectionService.getMeetingInfo();

          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) => MeetingSettingsDialog(
                connectionService: connectionService,
                isHost: state.isHost,
                meetingInfo: meetingInfo,
              ),
            );
          }
        },
      ),
    );
  }

  void _showLeaveConfirmation(BuildContext context, bool isHost) {
    final bloc = context.read<InMeetingBloc>();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          isHost ? 'End Meeting?' : 'Leave Meeting?',
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          isHost
              ? 'This will end the meeting for all participants. Are you sure?'
              : 'Are you sure you want to leave the meeting?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          if (isHost)
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                bloc.add(const InMeetingEvent.leaveCall());
              },
              child: const Text('Just Leave'),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              if (isHost) {
                bloc.add(const InMeetingEvent.endCallForAll());
              } else {
                bloc.add(const InMeetingEvent.leaveCall());
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(isHost ? 'End for All' : 'Leave'),
          ),
        ],
      ),
    );
  }
}
