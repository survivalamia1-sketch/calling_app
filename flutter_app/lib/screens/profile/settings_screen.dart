import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _autoMute = false;
  bool _startWithVideoOff = false;
  bool _emailNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Meeting Preferences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Auto-mute on join'),
            subtitle: const Text('Start meetings with microphone muted'),
            value: _autoMute,
            onChanged: (value) => setState(() => _autoMute = value),
          ),
          SwitchListTile(
            title: const Text('Start with camera off'),
            subtitle: const Text('Join meetings with video disabled'),
            value: _startWithVideoOff,
            onChanged: (value) => setState(() => _startWithVideoOff = value),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Email notifications'),
            subtitle: const Text('Receive meeting reminders and updates'),
            value: _emailNotifications,
            onChanged: (value) => setState(() => _emailNotifications = value),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Version'),
            subtitle: const Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
