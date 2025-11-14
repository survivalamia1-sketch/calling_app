import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/meeting_provider.dart';
import '../../widgets/loading_button.dart';

class CreateMeetingScreen extends StatefulWidget {
  const CreateMeetingScreen({super.key});

  @override
  State<CreateMeetingScreen> createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isScheduled = false;
  DateTime? _selectedDateTime;
  bool _usePassword = false;
  int _maxParticipants = 10;

  @override
  void dispose() {
    _titleController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null || !mounted) return;

    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String _generatePassword() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    return List.generate(6, (index) => chars[DateTime.now().microsecond % chars.length]).join();
  }

  Future<void> _handleCreateMeeting() async {
    if (!_formKey.currentState!.validate()) return;

    final meetingProvider = Provider.of<MeetingProvider>(context, listen: false);

    final meeting = await meetingProvider.createMeeting(
      name: _titleController.text.trim(),
      scheduledAt: _isScheduled ? _selectedDateTime : null,
      password: _usePassword ? _passwordController.text : null,
      maxParticipants: _maxParticipants,
    );

    if (!mounted) return;

    if (meeting != null) {
      // Show success dialog with meeting link
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Meeting Created!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meeting: ${meeting.name}'),
              const SizedBox(height: 8),
              Text('Code: ${meeting.meetingCode}'),
              if (_usePassword) ...[
                const SizedBox(height: 8),
                Text('Password: ${meeting.password}'),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: meeting.meetingCode ?? ''),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code copied!')),
                        );
                      },
                      icon: const Icon(Icons.copy, size: 16),
                      label: const Text('Copy Code'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(); // Close dialog
                context.pop(); // Go back to previous screen
              },
              child: const Text('Done'),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop(); // Close dialog
                context.go('/call/${meeting.id}');
              },
              child: const Text('Join Now'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(meetingProvider.error ?? 'Failed to create meeting'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Meeting'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meeting Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Meeting Title',
                  hintText: 'My awesome meeting',
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a meeting title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Scheduled or Instant
              Text(
                'When?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: false, label: Text('Now'), icon: Icon(Icons.play_arrow)),
                  ButtonSegment(value: true, label: Text('Schedule'), icon: Icon(Icons.schedule)),
                ],
                selected: {_isScheduled},
                onSelectionChanged: (Set<bool> newSelection) {
                  setState(() {
                    _isScheduled = newSelection.first;
                  });
                },
              ),

              if (_isScheduled) ...[
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today),
                  title: Text(
                    _selectedDateTime != null
                        ? DateFormat('EEE, MMM d, y • h:mm a').format(_selectedDateTime!)
                        : 'Select date and time',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _selectDateTime,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ],
              const SizedBox(height: 24),

              // Max Participants
              Text(
                'Max Participants',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Slider(
                value: _maxParticipants.toDouble(),
                min: 2,
                max: 100,
                divisions: 98,
                label: _maxParticipants.toString(),
                onChanged: (value) {
                  setState(() {
                    _maxParticipants = value.toInt();
                  });
                },
              ),
              Text(
                '$_maxParticipants participants',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),

              // Password Protection
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Password Protection'),
                subtitle: const Text('Require a password to join'),
                value: _usePassword,
                onChanged: (value) {
                  setState(() {
                    _usePassword = value;
                    if (value && _passwordController.text.isEmpty) {
                      _passwordController.text = _generatePassword();
                    }
                  });
                },
              ),

              if (_usePassword) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Meeting Password',
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          _passwordController.text = _generatePassword();
                        });
                      },
                      tooltip: 'Generate new password',
                    ),
                  ),
                  validator: (value) {
                    if (_usePassword && (value == null || value.isEmpty)) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ],
              const SizedBox(height: 32),

              // Create Button
              Consumer<MeetingProvider>(
                builder: (context, meetingProvider, child) {
                  return LoadingButton(
                    onPressed: _handleCreateMeeting,
                    isLoading: meetingProvider.isLoading,
                    child: Text(_isScheduled ? 'Schedule Meeting' : 'Create & Join'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
