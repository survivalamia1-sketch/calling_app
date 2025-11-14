import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Quick Actions
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Help',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    title: const Text('Email Support'),
                    subtitle: const Text('support@videocall.com'),
                    onTap: () async {
                      final uri = Uri(
                        scheme: 'mailto',
                        path: 'support@videocall.com',
                        query: 'subject=Support Request',
                      );
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.chat,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    title: const Text('Live Chat'),
                    subtitle: const Text('Chat with our team'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Live chat coming soon!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // FAQ Section
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),

          _buildFAQItem(
            context,
            'How do I start a meeting?',
            'You can start a meeting from the Home page by tapping the "Start Meeting" button. You can also schedule a meeting for later.',
          ),
          _buildFAQItem(
            context,
            'How do I join a meeting?',
            'Click on "Join Meeting" and enter the meeting code provided by the host. You can also join from meeting invitations.',
          ),
          _buildFAQItem(
            context,
            'Can I use the app on multiple devices?',
            'Yes! You can use your account on multiple devices. Just sign in with your email and password.',
          ),
          _buildFAQItem(
            context,
            'How do I upgrade my plan?',
            'Go to Settings > Subscription to view and upgrade your plan. We offer Free, Pro, and Enterprise plans.',
          ),
          _buildFAQItem(
            context,
            'Is my meeting secure?',
            'Yes, all meetings are encrypted end-to-end. We take your privacy and security seriously.',
          ),
          _buildFAQItem(
            context,
            'How do I cancel my subscription?',
            'Go to Settings > Subscription > Manage Subscription to cancel. You\'ll retain access until the end of your billing period.',
          ),
          const SizedBox(height: 24),

          // Resources
          Text(
            'Resources',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: const Text('User Guide'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Open user guide
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.video_library),
                  title: const Text('Video Tutorials'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Open tutorials
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.bug_report),
                  title: const Text('Report a Bug'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    _showBugReportDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBugReportDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report a Bug'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Bug Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Please describe the issue...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Submit bug report
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bug report submitted. Thank you!'),
                ),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
