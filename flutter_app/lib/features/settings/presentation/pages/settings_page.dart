import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _autoJoinAudio = false;
  bool _autoJoinVideo = true;
  String _videoQuality = 'HD';
  String _theme = 'system';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // General Settings
          _buildSectionHeader(context, 'General'),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive meeting reminders and updates'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() => _notificationsEnabled = value);
            },
          ),
          SwitchListTile(
            title: const Text('Email Notifications'),
            subtitle: const Text('Get updates via email'),
            value: _emailNotifications,
            onChanged: (value) {
              setState(() => _emailNotifications = value);
            },
          ),
          ListTile(
            title: const Text('Theme'),
            subtitle: Text(_theme == 'system'
                ? 'System Default'
                : _theme == 'light'
                    ? 'Light'
                    : 'Dark'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showThemeDialog();
            },
          ),
          const Divider(),

          // Meeting Preferences
          _buildSectionHeader(context, 'Meeting Preferences'),
          SwitchListTile(
            title: const Text('Auto-Join Audio'),
            subtitle: const Text('Automatically connect audio when joining'),
            value: _autoJoinAudio,
            onChanged: (value) {
              setState(() => _autoJoinAudio = value);
            },
          ),
          SwitchListTile(
            title: const Text('Auto-Join Video'),
            subtitle: const Text('Automatically enable camera when joining'),
            value: _autoJoinVideo,
            onChanged: (value) {
              setState(() => _autoJoinVideo = value);
            },
          ),
          ListTile(
            title: const Text('Video Quality'),
            subtitle: Text(_videoQuality),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showVideoQualityDialog();
            },
          ),
          const Divider(),

          // Account
          _buildSectionHeader(context, 'Account'),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to edit profile
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to privacy settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Security'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to security settings
            },
          ),
          const Divider(),

          // About
          _buildSectionHeader(context, 'About'),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('App Version'),
            subtitle: const Text('1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Open terms
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Open privacy policy
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('System Default'),
              value: 'system',
              groupValue: _theme,
              onChanged: (value) {
                setState(() => _theme = value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('Light'),
              value: 'light',
              groupValue: _theme,
              onChanged: (value) {
                setState(() => _theme = value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('Dark'),
              value: 'dark',
              groupValue: _theme,
              onChanged: (value) {
                setState(() => _theme = value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showVideoQualityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Video Quality'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('HD (720p)'),
              value: 'HD',
              groupValue: _videoQuality,
              onChanged: (value) {
                setState(() => _videoQuality = value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('SD (480p)'),
              value: 'SD',
              groupValue: _videoQuality,
              onChanged: (value) {
                setState(() => _videoQuality = value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('Low (360p)'),
              value: 'Low',
              groupValue: _videoQuality,
              onChanged: (value) {
                setState(() => _videoQuality = value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
