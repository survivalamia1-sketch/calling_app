import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/entities/bug_report.dart';
import '../../domain/entities/faq.dart';
import '../bloc/support_bloc.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  void initState() {
    super.initState();
    // Load FAQs when page opens
    context.read<SupportBloc>().add(const SupportEvent.loadFAQs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: BlocConsumer<SupportBloc, SupportState>(
        listener: (context, state) {
          state.whenOrNull(
            bugReportSubmitted: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bug report submitted. Thank you!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<SupportBloc>().add(const SupportEvent.loadFAQs());
            },
            child: ListView(
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
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Frequently Asked Questions',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (state is Loading)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // FAQ List
                state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  faqsLoaded: (faqs) => _buildFAQList(context, faqs),
                  bugReportSubmitted: () => _buildFAQList(context, []),
                  error: (message) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            context
                                .read<SupportBloc>()
                                .add(const SupportEvent.loadFAQs());
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('User guide coming soon!')),
                          );
                        },
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.video_library),
                        title: const Text('Video Tutorials'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // TODO: Open tutorials
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Video tutorials coming soon!')),
                          );
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
        },
      ),
    );
  }

  Widget _buildFAQList(BuildContext context, List<FAQ> faqs) {
    if (faqs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.help_outline,
                size: 48,
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'No FAQs available',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: faqs.map((faq) => _buildFAQItem(context, faq)).toList(),
    );
  }

  Widget _buildFAQItem(BuildContext context, FAQ faq) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              faq.answer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
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
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<SupportBloc>(),
        child: AlertDialog(
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
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            BlocBuilder<SupportBloc, SupportState>(
              builder: (context, state) {
                final isLoading = state is Loading;

                return ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (titleController.text.isEmpty ||
                              descriptionController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please fill in all required fields'),
                                backgroundColor: Colors.orange,
                              ),
                            );
                            return;
                          }

                          // Get device info and app version
                          String? deviceInfo;
                          String? appVersion;

                          try {
                            final packageInfo =
                                await PackageInfo.fromPlatform();
                            appVersion = packageInfo.version;

                            final deviceInfoPlugin = DeviceInfoPlugin();
                            if (Platform.isAndroid) {
                              final androidInfo =
                                  await deviceInfoPlugin.androidInfo;
                              deviceInfo =
                                  'Android ${androidInfo.version.release} (${androidInfo.model})';
                            } else if (Platform.isIOS) {
                              final iosInfo = await deviceInfoPlugin.iosInfo;
                              deviceInfo =
                                  'iOS ${iosInfo.systemVersion} (${iosInfo.model})';
                            }
                          } catch (e) {
                            // Ignore errors getting device info
                          }

                          // Get user email if authenticated
                          String? contactEmail;
                          if (!context.mounted) return;
                          final authState = context.read<AuthBloc>().state;
                          authState.maybeWhen(
                            authenticated: (user) {
                              contactEmail = user.email;
                            },
                            orElse: () {},
                          );

                          final bugReport = BugReport(
                            title: titleController.text.trim(),
                            description: descriptionController.text.trim(),
                            contactEmail: contactEmail,
                            deviceInfo: deviceInfo,
                            appVersion: appVersion,
                          );

                          if (context.mounted) {
                            context.read<SupportBloc>().add(
                                  SupportEvent.submitBugReport(
                                    bugReport: bugReport,
                                  ),
                                );

                            Navigator.pop(dialogContext);
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
