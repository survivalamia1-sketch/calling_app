import 'package:flutter/material.dart';

import '../../domain/repositories/meeting_connection_service.dart';

/// Dialog for meeting settings and controls
class MeetingSettingsDialog extends StatefulWidget {
  final MeetingConnectionService connectionService;
  final bool isHost;
  final MeetingInfo? meetingInfo;

  const MeetingSettingsDialog({
    super.key,
    required this.connectionService,
    required this.isHost,
    this.meetingInfo,
  });

  @override
  State<MeetingSettingsDialog> createState() => _MeetingSettingsDialogState();
}

class _MeetingSettingsDialogState extends State<MeetingSettingsDialog> {
  bool _isRecording = false;
  String _videoQuality = 'HD';
  bool _echoCancellation = true;
  bool _noiseSuppression = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    // Load current meeting info
    if (widget.meetingInfo != null) {
      setState(() {
        _isRecording = widget.meetingInfo!.isRecording;
      });
    }
  }

  Future<void> _toggleRecording() async {
    if (!widget.isHost) {
      _showMessage('Only the host can control recording', isError: true);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement recording toggle via backend API
      // For now, just toggle the local state
      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        _isRecording = !_isRecording;
        _isLoading = false;
      });

      _showMessage(
        _isRecording ? 'Recording started' : 'Recording stopped',
        isError: false,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showMessage('Failed to toggle recording: $e', isError: true);
    }
  }

  void _showMessage(String message, {required bool isError}) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.red : Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Meeting Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Meeting Info Section
                    if (widget.meetingInfo != null) ...[
                      _buildSectionTitle('Meeting Information'),
                      _buildInfoCard(),
                      const SizedBox(height: 24),
                    ],

                    // Recording Section
                    if (widget.isHost) ...[
                      _buildSectionTitle('Recording'),
                      _buildRecordingCard(),
                      const SizedBox(height: 24),
                    ],

                    // Video Quality Section
                    _buildSectionTitle('Video Quality'),
                    _buildVideoQualityCard(),
                    const SizedBox(height: 24),

                    // Audio Settings Section
                    _buildSectionTitle('Audio Enhancements'),
                    _buildAudioSettingsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    final info = widget.meetingInfo!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Meeting ID', info.id),
          if (info.meetingCode != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow('Meeting Code', info.meetingCode!),
          ],
          const SizedBox(height: 8),
          _buildInfoRow('Host', info.hostName ?? 'Unknown'),
          const SizedBox(height: 8),
          _buildInfoRow(
            'Started',
            _formatDateTime(info.startedAt),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildRecordingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                _isRecording ? Icons.fiber_manual_record : Icons.stop_circle,
                color: _isRecording ? Colors.red : Colors.white70,
                size: 24,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isRecording ? 'Recording in progress' : 'Start recording',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (_isRecording)
                    const Text(
                      'Meeting is being recorded',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ],
          ),
          _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                )
              : Switch(
                  value: _isRecording,
                  onChanged: (_) => _toggleRecording(),
                  activeTrackColor: Colors.red,
                  activeThumbColor: Colors.white,
                ),
        ],
      ),
    );
  }

  Widget _buildVideoQualityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Video Resolution',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _buildQualityChip('SD', '480p'),
              _buildQualityChip('HD', '720p'),
              _buildQualityChip('FHD', '1080p'),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Higher quality uses more bandwidth',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQualityChip(String label, String resolution) {
    final isSelected = _videoQuality == label;
    return ChoiceChip(
      label: Text(
        '$label ($resolution)',
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white70,
          fontSize: 12,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _videoQuality = label;
          });
          _showMessage('Video quality changed to $label', isError: false);
        }
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[800],
    );
  }

  Widget _buildAudioSettingsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildAudioToggle(
            'Echo Cancellation',
            'Reduce echo and feedback',
            _echoCancellation,
            (value) {
              setState(() {
                _echoCancellation = value;
              });
              _showMessage(
                'Echo cancellation ${value ? 'enabled' : 'disabled'}',
                isError: false,
              );
            },
          ),
          const Divider(color: Colors.white24, height: 24),
          _buildAudioToggle(
            'Noise Suppression',
            'Filter background noise',
            _noiseSuppression,
            (value) {
              setState(() {
                _noiseSuppression = value;
              });
              _showMessage(
                'Noise suppression ${value ? 'enabled' : 'disabled'}',
                isError: false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAudioToggle(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: Colors.blue,
          activeThumbColor: Colors.white,
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
    }
  }
}
