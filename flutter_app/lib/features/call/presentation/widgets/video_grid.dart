import 'package:flutter/material.dart';

import '../../domain/entities/meeting_layout.dart';
import '../../domain/entities/participant.dart';
import 'participant_video_tile.dart';

/// Video grid component that displays participants based on layout mode
class VideoGrid extends StatelessWidget {
  final List<Participant> participants;
  final MeetingLayout layout;
  final Participant? pinnedParticipant;
  final Participant? activeSpeaker;
  final VoidCallback? onTap;

  const VideoGrid({
    super.key,
    required this.participants,
    required this.layout,
    this.pinnedParticipant,
    this.activeSpeaker,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return _buildEmptyState();
    }

    switch (layout) {
      case MeetingLayout.gallery:
        return _buildGalleryView();
      case MeetingLayout.speaker:
        return _buildSpeakerView();
      case MeetingLayout.pinned:
        return _buildPinnedView();
    }
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: Colors.white38,
          ),
          SizedBox(height: 16),
          Text(
            'Waiting for others to join...',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryView() {
    // Calculate grid dimensions based on participant count
    final itemCount = participants.length;
    final crossAxisCount = _getGridCrossAxisCount(itemCount);

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 16 / 9,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ParticipantVideoTile(
          participant: participants[index],
          isActiveSpeaker: participants[index].id == activeSpeaker?.id,
        );
      },
    );
  }

  Widget _buildSpeakerView() {
    final speaker = activeSpeaker ?? participants.first;
    final otherParticipants =
        participants.where((p) => p.id != speaker.id).toList();

    return Column(
      children: [
        // Main speaker view
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ParticipantVideoTile(
              participant: speaker,
              isActiveSpeaker: true,
              isFocused: true,
            ),
          ),
        ),

        // Thumbnail strip of other participants
        if (otherParticipants.isNotEmpty)
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              itemCount: otherParticipants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 160,
                    child: ParticipantVideoTile(
                      participant: otherParticipants[index],
                      isActiveSpeaker: false,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildPinnedView() {
    if (pinnedParticipant == null) {
      return _buildGalleryView();
    }

    final otherParticipants =
        participants.where((p) => p.id != pinnedParticipant!.id).toList();

    return Column(
      children: [
        // Pinned participant view
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ParticipantVideoTile(
              participant: pinnedParticipant!,
              isActiveSpeaker: pinnedParticipant!.id == activeSpeaker?.id,
              isFocused: true,
              isPinned: true,
            ),
          ),
        ),

        // Thumbnail strip of other participants
        if (otherParticipants.isNotEmpty)
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              itemCount: otherParticipants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 160,
                    child: ParticipantVideoTile(
                      participant: otherParticipants[index],
                      isActiveSpeaker:
                          otherParticipants[index].id == activeSpeaker?.id,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  int _getGridCrossAxisCount(int itemCount) {
    if (itemCount == 1) return 1;
    if (itemCount <= 4) return 2;
    if (itemCount <= 9) return 3;
    return 4;
  }
}
