import 'package:flutter/material.dart';

import '../../domain/entities/participant.dart';

/// Panel showing list of participants with host controls
class ParticipantsPanel extends StatelessWidget {
  final List<Participant> participants;
  final bool isHost;
  final Function(String participantId)? onMuteParticipant;
  final Function(String participantId)? onRemoveParticipant;
  final Function(String participantId)? onPinParticipant;

  const ParticipantsPanel({
    super.key,
    required this.participants,
    this.isHost = false,
    this.onMuteParticipant,
    this.onRemoveParticipant,
    this.onPinParticipant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(-2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              border: const Border(
                bottom: BorderSide(color: Colors.white12),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.people, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Participants (${participants.length})',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Participants list
          Expanded(
            child: participants.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: participants.length,
                    itemBuilder: (context, index) {
                      return _ParticipantListItem(
                        participant: participants[index],
                        isHost: isHost,
                        onMute: onMuteParticipant != null
                            ? () => onMuteParticipant!(participants[index].id)
                            : null,
                        onRemove: onRemoveParticipant != null
                            ? () => onRemoveParticipant!(participants[index].id)
                            : null,
                        onPin: onPinParticipant != null
                            ? () => onPinParticipant!(participants[index].id)
                            : null,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
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
            'No participants yet',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _ParticipantListItem extends StatelessWidget {
  final Participant participant;
  final bool isHost;
  final VoidCallback? onMute;
  final VoidCallback? onRemove;
  final VoidCallback? onPin;

  const _ParticipantListItem({
    required this.participant,
    this.isHost = false,
    this.onMute,
    this.onRemove,
    this.onPin,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (isHost) {
            _showParticipantOptions(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: _getAvatarColor(),
                backgroundImage: participant.avatarUrl != null
                    ? NetworkImage(participant.avatarUrl!)
                    : null,
                child: participant.avatarUrl == null
                    ? Text(
                        participant.initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),

              // Name and status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            participant.displayName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (participant.isHost) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'HOST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          participant.isMuted ? Icons.mic_off : Icons.mic,
                          size: 12,
                          color:
                              participant.isMuted ? Colors.red : Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          participant.isVideoOn
                              ? Icons.videocam
                              : Icons.videocam_off,
                          size: 12,
                          color: participant.isVideoOn
                              ? Colors.green
                              : Colors.grey,
                        ),
                        if (participant.isScreenSharing) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.screen_share,
                            size: 12,
                            color: Colors.blue,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // Hand raised indicator
              if (participant.isHandRaised)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.back_hand,
                    size: 16,
                    color: Colors.white,
                  ),
                ),

              // More options for host
              if (isHost && !participant.isHost)
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white70),
                  onPressed: () => _showParticipantOptions(context),
                  iconSize: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showParticipantOptions(BuildContext context) {
    if (!isHost || participant.isHost) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: _getAvatarColor(),
                  backgroundImage: participant.avatarUrl != null
                      ? NetworkImage(participant.avatarUrl!)
                      : null,
                  child: participant.avatarUrl == null
                      ? Text(
                          participant.initials,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    participant.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white12, height: 1),

          // Options
          ListTile(
            leading: const Icon(Icons.push_pin, color: Colors.white),
            title: const Text(
              'Pin participant',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onPin?.call();
            },
          ),
          if (!participant.isMuted)
            ListTile(
              leading: const Icon(Icons.mic_off, color: Colors.white),
              title: const Text(
                'Mute participant',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                onMute?.call();
              },
            ),
          ListTile(
            leading: const Icon(Icons.remove_circle, color: Colors.red),
            title: const Text(
              'Remove from meeting',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              onRemove?.call();
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Color _getAvatarColor() {
    final hash = participant.id.hashCode;
    final colors = [
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.red,
      Colors.orange,
      Colors.teal,
      Colors.green,
      Colors.indigo,
    ];
    return colors[hash.abs() % colors.length];
  }
}
