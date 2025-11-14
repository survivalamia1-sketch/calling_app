import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../providers/meeting_provider.dart';
import '../../widgets/loading_button.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _requiresPassword = false;

  @override
  void dispose() {
    _codeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleJoin() async {
    if (!_formKey.currentState!.validate()) return;

    final meetingProvider = Provider.of<MeetingProvider>(context, listen: false);

    final meeting = await meetingProvider.joinMeetingByCode(
      _codeController.text.trim(),
      password: _requiresPassword ? _passwordController.text : null,
    );

    if (!mounted) return;

    if (meeting != null) {
      context.go('/call/${meeting.id}');
    } else {
      // Check if password is required
      if (meetingProvider.error?.contains('password') == true) {
        setState(() {
          _requiresPassword = true;
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(meetingProvider.error ?? 'Failed to join meeting'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Meeting'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.meeting_room_outlined,
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 24),
              Text(
                'Enter Meeting Code',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the meeting code shared with you',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 32),

              // Meeting Code
              TextFormField(
                controller: _codeController,
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  labelText: 'Meeting Code',
                  hintText: 'ABC-DEF-GHI',
                  prefixIcon: Icon(Icons.tag),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter meeting code';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Auto-format code with dashes
                  if (value.length == 3 || value.length == 7) {
                    _codeController.text = '$value-';
                    _codeController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _codeController.text.length),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),

              // Password (if required)
              if (_requiresPassword) ...[
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Meeting Password',
                    hintText: 'Enter password',
                    prefixIcon: Icon(Icons.lock_outlined),
                  ),
                  validator: (value) {
                    if (_requiresPassword && (value == null || value.isEmpty)) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
              ],

              const SizedBox(height: 8),

              // Join Button
              Consumer<MeetingProvider>(
                builder: (context, meetingProvider, child) {
                  return LoadingButton(
                    onPressed: _handleJoin,
                    isLoading: meetingProvider.isLoading,
                    child: const Text('Join Meeting'),
                  );
                },
              ),

              const SizedBox(height: 32),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),

              const SizedBox(height: 32),

              // Scan QR Code
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement QR code scanning
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('QR code scanning coming soon'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Scan QR Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
