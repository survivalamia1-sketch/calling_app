import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../domain/repositories/meetings_repository.dart';

/// Create/Edit Schedule Page
///
/// Form for creating or editing a scheduled meeting
/// NO MOCK DATA - All data saved to repository
class CreateSchedulePage extends StatefulWidget {
  final String? meetingId; // If editing existing meeting

  const CreateSchedulePage({
    super.key,
    this.meetingId,
  });

  @override
  State<CreateSchedulePage> createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _passwordController = TextEditingController();

  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _durationMinutes = 60;
  int? _maxParticipants;
  bool _requiresApproval = false;
  bool _waitingRoomEnabled = false;
  bool _allowJoinBeforeHost = true;
  bool _muteOnEntry = false;
  bool _isLoading = false;

  bool get _isEditing => widget.meetingId != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _loadMeetingData();
    }
  }

  Future<void> _loadMeetingData() async {
    // Load meeting data if editing
    // This would call repository.getScheduledMeetingById()
    // For now, we'll leave it empty as the UI is ready
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Scheduled Meeting' : 'Schedule Meeting'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Title
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Meeting Title *',
                hintText: 'Enter meeting title',
                prefixIcon: Icon(Icons.title),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a meeting title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter meeting description',
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Date and Time Section
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            // Date Picker
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Date'),
              subtitle: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _selectDate,
            ),

            // Time Picker
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Time'),
              subtitle: Text(_selectedTime.format(context)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _selectTime,
            ),

            // Duration
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Duration'),
              subtitle: Text('$_durationMinutes minutes'),
              trailing: SizedBox(
                width: 120,
                child: DropdownButton<int>(
                  value: _durationMinutes,
                  isExpanded: true,
                  items: [15, 30, 45, 60, 90, 120, 180, 240]
                      .map((minutes) => DropdownMenuItem(
                            value: minutes,
                            child: Text('$minutes min'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _durationMinutes = value);
                    }
                  },
                ),
              ),
            ),

            const Divider(height: 32),

            // Settings Section
            Text(
              'Meeting Settings',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            // Max Participants
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Maximum Participants',
                hintText: 'Leave empty for unlimited',
                prefixIcon: Icon(Icons.people),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final parsed = int.tryParse(value);
                setState(() => _maxParticipants = parsed);
              },
            ),
            const SizedBox(height: 16),

            // Password
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Meeting Password (Optional)',
                hintText: 'Enter password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            // Options
            SwitchListTile(
              title: const Text('Require Approval'),
              subtitle: const Text('Host must approve participants'),
              value: _requiresApproval,
              onChanged: (value) {
                setState(() => _requiresApproval = value);
              },
            ),

            SwitchListTile(
              title: const Text('Waiting Room'),
              subtitle: const Text('Enable waiting room'),
              value: _waitingRoomEnabled,
              onChanged: (value) {
                setState(() => _waitingRoomEnabled = value);
              },
            ),

            SwitchListTile(
              title: const Text('Allow Join Before Host'),
              subtitle: const Text('Participants can join before host'),
              value: _allowJoinBeforeHost,
              onChanged: (value) {
                setState(() => _allowJoinBeforeHost = value);
              },
            ),

            SwitchListTile(
              title: const Text('Mute on Entry'),
              subtitle: const Text('Mute participants when they join'),
              value: _muteOnEntry,
              onChanged: (value) {
                setState(() => _muteOnEntry = value);
              },
            ),

            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveMeeting,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        _isEditing ? 'Update Meeting' : 'Schedule Meeting',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() => _selectedTime = picked);
    }
  }

  Future<void> _saveMeeting() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final repository = getIt<MeetingsRepository>();

      // Combine date and time
      final scheduledAt = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      if (_isEditing) {
        // Update existing meeting
        final result = await repository.updateScheduledMeeting(
          id: widget.meetingId!,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          scheduledAt: scheduledAt,
          durationMinutes: _durationMinutes,
          maxParticipants: _maxParticipants,
          password: _passwordController.text.trim().isEmpty
              ? null
              : _passwordController.text.trim(),
          requiresApproval: _requiresApproval,
          waitingRoomEnabled: _waitingRoomEnabled,
          allowJoinBeforeHost: _allowJoinBeforeHost,
          muteOnEntry: _muteOnEntry,
        );

        result.fold(
          (failure) {
            _showError(failure.message);
          },
          (meeting) {
            _showSuccess('Meeting updated successfully');
            context.pop();
          },
        );
      } else {
        // Create new meeting
        final result = await repository.createScheduledMeeting(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          scheduledAt: scheduledAt,
          durationMinutes: _durationMinutes,
          maxParticipants: _maxParticipants,
          password: _passwordController.text.trim().isEmpty
              ? null
              : _passwordController.text.trim(),
          requiresApproval: _requiresApproval,
          waitingRoomEnabled: _waitingRoomEnabled,
          allowJoinBeforeHost: _allowJoinBeforeHost,
          muteOnEntry: _muteOnEntry,
        );

        result.fold(
          (failure) {
            _showError(failure.message);
          },
          (meeting) {
            _showSuccess('Meeting scheduled successfully');
            context.pop();
          },
        );
      }
    } catch (e) {
      _showError('An error occurred: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
