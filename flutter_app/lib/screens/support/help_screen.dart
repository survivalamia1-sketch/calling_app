import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          _FAQTile(
            question: 'How do I schedule a meeting?',
            answer:
                'Go to the home screen and tap "Schedule". Select the date and time, add a title, and create your meeting.',
          ),
          _FAQTile(
            question: 'How do I invite participants?',
            answer:
                'After creating a meeting, share the meeting code or link with participants. They can join using the code.',
          ),
          _FAQTile(
            question: 'How does billing work?',
            answer:
                'Choose a plan (Free, Pro, or Business) and billing is automatic. View your invoices in the Billing section.',
          ),
          _FAQTile(
            question: 'Can I record meetings?',
            answer:
                'Recording is available on Pro and Business plans. Enable it during your meeting.',
          ),
          const SizedBox(height: 24),
          Text(
            'Contact Support',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Email Support'),
              subtitle: const Text('support@callingapp.com'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Open email
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQTile({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(question),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
