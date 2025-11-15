import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SettingsBloc>()..add(const SettingsEvent.loadSettings()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: [
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.restore),
                  tooltip: 'Reset to defaults',
                  onPressed: () {
                    _showResetDialog(context);
                  },
                );
              },
            ),
          ],
        ),
        body: BlocConsumer<SettingsBloc, SettingsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              updated: (settings) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings saved'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (settings) => _buildSettingsList(context, settings),
              updated: (settings) => _buildSettingsList(context, settings),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<SettingsBloc>()
                            .add(const SettingsEvent.loadSettings());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context, settings) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Notifications Section
        _buildSectionHeader(context, 'Notifications'),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive meeting reminders'),
                value: settings.notificationsEnabled,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.toggleNotifications(value: value),
                      );
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Email Notifications'),
                subtitle: const Text('Receive updates via email'),
                value: settings.emailNotifications,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.toggleEmailNotifications(value: value),
                      );
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Sound'),
                subtitle: const Text('Play notification sounds'),
                value: settings.soundEnabled,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.toggleSound(value: value),
                      );
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Vibration'),
                subtitle: const Text('Vibrate on notifications'),
                value: settings.vibrationEnabled,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.toggleVibration(value: value),
                      );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Appearance Section
        _buildSectionHeader(context, 'Appearance'),
        Card(
          child: Column(
            children: [
              ListTile(
                title: const Text('Theme'),
                subtitle: Text(_getThemeName(settings.theme)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showThemeDialog(context, settings.theme),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Meeting Preferences Section
        _buildSectionHeader(context, 'Meeting Preferences'),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Auto-join Audio'),
                subtitle: const Text('Join with microphone on'),
                value: settings.autoJoinAudio,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.toggleAutoJoinAudio(value: value),
                      );
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Auto-join Video'),
                subtitle: const Text('Join with camera on'),
                value: settings.autoJoinVideo,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.toggleAutoJoinVideo(value: value),
                      );
                },
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text('Video Quality'),
                subtitle: Text(settings.videoQuality),
                trailing: const Icon(Icons.chevron_right),
                onTap: () =>
                    _showVideoQualityDialog(context, settings.videoQuality),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Account Section
        _buildSectionHeader(context, 'Account'),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push('/profile');
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Privacy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Privacy settings coming soon')),
                  );
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Security'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Security settings coming soon')),
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // About Section
        _buildSectionHeader(context, 'About'),
        Card(
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('App Version'),
                subtitle: Text('1.0.0'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Opening Terms of Service...')),
                  );
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening Privacy Policy...')),
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  String _getThemeName(String theme) {
    switch (theme) {
      case 'light':
        return 'Light';
      case 'dark':
        return 'Dark';
      case 'system':
      default:
        return 'System Default';
    }
  }

  void _showThemeDialog(BuildContext context, String currentTheme) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioGroup<String>(
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.changeTheme(theme: value),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('System Default'),
            ),
            RadioGroup<String>(
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.changeTheme(theme: value),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Light'),
            ),
            RadioGroup<String>(
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.changeTheme(theme: value),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Dark'),
            ),
          ],
        ),
      ),
    );
  }

  void _showVideoQualityDialog(BuildContext context, String currentQuality) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Video Quality'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioGroup<String>(
              groupValue: currentQuality,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.changeVideoQuality(quality: value),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('HD (1080p)'),
            ),
            RadioGroup<String>(
              groupValue: currentQuality,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.changeVideoQuality(quality: value),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('SD (720p)'),
            ),
            RadioGroup<String>(
              groupValue: currentQuality,
              onChanged: (value) {
                if (value != null) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.changeVideoQuality(quality: value),
                      );
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Low (480p)'),
            ),
          ],
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset Settings'),
        content: const Text(
          'Are you sure you want to reset all settings to default values?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<SettingsBloc>().add(
                    const SettingsEvent.resetSettings(),
                  );
              Navigator.pop(dialogContext);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
