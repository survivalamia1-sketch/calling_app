import 'package:flutter/material.dart';

/// Page displaying user guide and documentation
class UserGuidePage extends StatelessWidget {
  const UserGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Guide'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: 'Getting Started',
            icon: Icons.rocket_launch,
            items: [
              GuideItem(
                title: 'Create Your Account',
                description: 'Sign up with your email and create a secure password to get started with the calling app.',
              ),
              GuideItem(
                title: 'Set Up Your Profile',
                description: 'Add your display name and profile picture to personalize your experience.',
              ),
              GuideItem(
                title: 'Test Your Camera and Mic',
                description: 'Go to Settings to test your camera and microphone before joining a meeting.',
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildSection(
            title: 'Starting a Meeting',
            icon: Icons.videocam,
            items: [
              GuideItem(
                title: 'Instant Meeting',
                description: 'Click "New Meeting" on the dashboard to start an instant meeting. Share the room code with participants.',
              ),
              GuideItem(
                title: 'Schedule a Meeting',
                description: 'Use the "Schedule" option to create a future meeting. Set the time, duration, and invite participants.',
              ),
              GuideItem(
                title: 'Join with Code',
                description: 'Enter a meeting code to join someone else\'s meeting instantly.',
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildSection(
            title: 'During a Meeting',
            icon: Icons.settings,
            items: [
              GuideItem(
                title: 'Mute/Unmute',
                description: 'Click the microphone icon at the bottom to mute or unmute your audio.',
              ),
              GuideItem(
                title: 'Camera On/Off',
                description: 'Click the camera icon to turn your video on or off.',
              ),
              GuideItem(
                title: 'Share Screen',
                description: 'Click the screen share icon to share your screen with participants (desktop only).',
              ),
              GuideItem(
                title: 'Chat',
                description: 'Open the chat panel to send messages to all participants or privately.',
              ),
              GuideItem(
                title: 'Participants',
                description: 'View the list of participants, mute individuals, or remove them from the meeting.',
              ),
              GuideItem(
                title: 'Change Layout',
                description: 'Switch between grid view, speaker view, or focus mode using the layout selector.',
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildSection(
            title: 'Host Controls',
            icon: Icons.admin_panel_settings,
            items: [
              GuideItem(
                title: 'Manage Participants',
                description: 'As the host, you can mute participants, remove them, or promote them to co-host.',
              ),
              GuideItem(
                title: 'Start Recording',
                description: 'Click the record button to start recording the meeting. Recordings are saved to your account.',
              ),
              GuideItem(
                title: 'Lock Meeting',
                description: 'Lock the meeting to prevent new participants from joining.',
              ),
              GuideItem(
                title: 'End Meeting',
                description: 'End the meeting for all participants using the "End for All" option.',
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildSection(
            title: 'Settings & Preferences',
            icon: Icons.tune,
            items: [
              GuideItem(
                title: 'Audio Devices',
                description: 'Select your preferred microphone and speaker from the device settings.',
              ),
              GuideItem(
                title: 'Video Devices',
                description: 'Choose which camera to use if you have multiple cameras.',
              ),
              GuideItem(
                title: 'Video Quality',
                description: 'Adjust video quality based on your internet connection (SD, HD, or FHD).',
              ),
              GuideItem(
                title: 'Notifications',
                description: 'Manage notification preferences for meeting invites and updates.',
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildSection(
            title: 'Troubleshooting',
            icon: Icons.help,
            items: [
              GuideItem(
                title: 'Can\'t Hear Others',
                description: 'Check your speaker volume and ensure the correct audio output device is selected.',
              ),
              GuideItem(
                title: 'Others Can\'t Hear You',
                description: 'Make sure you\'re unmuted and your microphone has permission to access.',
              ),
              GuideItem(
                title: 'Video Not Working',
                description: 'Check camera permissions and ensure no other app is using your camera.',
              ),
              GuideItem(
                title: 'Poor Connection',
                description: 'Lower your video quality, close other apps, or switch to a better network.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<GuideItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...items.map((item) => _buildGuideItem(item)),
      ],
    );
  }

  Widget _buildGuideItem(GuideItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class GuideItem {
  final String title;
  final String description;

  GuideItem({
    required this.title,
    required this.description,
  });
}
