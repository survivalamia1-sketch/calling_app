import 'package:flutter/material.dart';

/// Bottom sheet with more meeting options
class MoreOptionsSheet extends StatelessWidget {
  final bool isHost;
  final VoidCallback? onSwitchCamera;
  final VoidCallback? onSelectAudioDevice;
  final VoidCallback? onSelectVideoDevice;
  final VoidCallback? onSettings;

  const MoreOptionsSheet({
    super.key,
    this.isHost = false,
    this.onSwitchCamera,
    this.onSelectAudioDevice,
    this.onSelectVideoDevice,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.more_horiz, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'More Options',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.white12, height: 1),

            // Options
            _OptionTile(
              icon: Icons.flip_camera_ios,
              title: 'Switch Camera',
              subtitle: 'Change between front and back camera',
              onTap: () {
                Navigator.pop(context);
                onSwitchCamera?.call();
              },
            ),
            _OptionTile(
              icon: Icons.mic,
              title: 'Audio Settings',
              subtitle: 'Select microphone and speaker',
              onTap: () {
                Navigator.pop(context);
                onSelectAudioDevice?.call();
              },
            ),
            _OptionTile(
              icon: Icons.videocam,
              title: 'Video Settings',
              subtitle: 'Select camera device',
              onTap: () {
                Navigator.pop(context);
                onSelectVideoDevice?.call();
              },
            ),

            const Divider(color: Colors.white12, height: 1),

            _OptionTile(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Adjust meeting preferences',
              onTap: () {
                Navigator.pop(context);
                onSettings?.call();
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const _OptionTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Arrow
              const Icon(
                Icons.chevron_right,
                color: Colors.white38,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
