import 'package:flutter/material.dart';

/// Page displaying video tutorials and how-to guides
class TutorialsPage extends StatelessWidget {
  const TutorialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Tutorials'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Learn how to use the calling app with these step-by-step video tutorials.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          _buildTutorialCategory(
            title: 'Getting Started',
            tutorials: [
              Tutorial(
                title: 'Quick Start Guide',
                description: 'Learn the basics of using the calling app in just 3 minutes.',
                duration: '3:24',
                thumbnailIcon: Icons.play_circle_filled,
              ),
              Tutorial(
                title: 'Setting Up Your Profile',
                description: 'Customize your profile and preferences.',
                duration: '2:15',
                thumbnailIcon: Icons.person,
              ),
              Tutorial(
                title: 'Testing Audio & Video',
                description: 'Make sure your camera and microphone work before your first meeting.',
                duration: '1:45',
                thumbnailIcon: Icons.settings,
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildTutorialCategory(
            title: 'Creating Meetings',
            tutorials: [
              Tutorial(
                title: 'Start an Instant Meeting',
                description: 'Create and share a meeting room in seconds.',
                duration: '2:30',
                thumbnailIcon: Icons.add_circle,
              ),
              Tutorial(
                title: 'Schedule Future Meetings',
                description: 'Plan ahead by scheduling meetings for later.',
                duration: '3:45',
                thumbnailIcon: Icons.calendar_month,
              ),
              Tutorial(
                title: 'Joining a Meeting',
                description: 'Different ways to join a meeting using codes or links.',
                duration: '2:10',
                thumbnailIcon: Icons.login,
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildTutorialCategory(
            title: 'In-Meeting Features',
            tutorials: [
              Tutorial(
                title: 'Audio & Video Controls',
                description: 'Master mute, camera toggle, and device switching.',
                duration: '3:15',
                thumbnailIcon: Icons.videocam,
              ),
              Tutorial(
                title: 'Screen Sharing',
                description: 'Share your screen with participants (desktop only).',
                duration: '2:50',
                thumbnailIcon: Icons.screen_share,
              ),
              Tutorial(
                title: 'Using the Chat',
                description: 'Send messages, files, and use chat features.',
                duration: '2:20',
                thumbnailIcon: Icons.chat,
              ),
              Tutorial(
                title: 'Changing View Layouts',
                description: 'Switch between grid, speaker, and focus modes.',
                duration: '1:55',
                thumbnailIcon: Icons.view_quilt,
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildTutorialCategory(
            title: 'Host Controls',
            tutorials: [
              Tutorial(
                title: 'Managing Participants',
                description: 'Mute, remove, or manage participant permissions.',
                duration: '4:10',
                thumbnailIcon: Icons.group,
              ),
              Tutorial(
                title: 'Recording Meetings',
                description: 'Start, stop, and access meeting recordings.',
                duration: '3:05',
                thumbnailIcon: Icons.fiber_manual_record,
              ),
              Tutorial(
                title: 'Security Settings',
                description: 'Lock meetings, enable waiting room, and more.',
                duration: '3:30',
                thumbnailIcon: Icons.security,
              ),
            ],
          ),
          const SizedBox(height: 24),

          _buildTutorialCategory(
            title: 'Advanced Topics',
            tutorials: [
              Tutorial(
                title: 'Optimizing Connection Quality',
                description: 'Tips for better video quality and stable connections.',
                duration: '4:25',
                thumbnailIcon: Icons.speed,
              ),
              Tutorial(
                title: 'Keyboard Shortcuts',
                description: 'Speed up your workflow with keyboard shortcuts.',
                duration: '2:40',
                thumbnailIcon: Icons.keyboard,
              ),
              Tutorial(
                title: 'Mobile App Features',
                description: 'Learn about mobile-specific features and limitations.',
                duration: '3:50',
                thumbnailIcon: Icons.phone_android,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialCategory({
    required String title,
    required List<Tutorial> tutorials,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...tutorials.map((tutorial) => _buildTutorialCard(tutorial)),
      ],
    );
  }

  Widget _buildTutorialCard(Tutorial tutorial) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // TODO: Open tutorial video
          // In a real implementation, this would open a video player
          // or navigate to a YouTube/Vimeo link
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail placeholder
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  tutorial.thumbnailIcon,
                  size: 40,
                  color: Colors.blue[700],
                ),
              ),
              const SizedBox(width: 16),

              // Tutorial info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutorial.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      tutorial.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          tutorial.duration,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Play icon
              Icon(
                Icons.play_circle_outline,
                size: 32,
                color: Colors.blue[600],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tutorial {
  final String title;
  final String description;
  final String duration;
  final IconData thumbnailIcon;

  Tutorial({
    required this.title,
    required this.description,
    required this.duration,
    required this.thumbnailIcon,
  });
}
