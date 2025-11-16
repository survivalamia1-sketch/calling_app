import 'package:flutter/material.dart';

import '../../domain/repositories/meeting_media_service.dart';

/// Dialog for selecting audio input/output devices
class AudioDeviceSelector extends StatefulWidget {
  final MeetingMediaService mediaService;

  const AudioDeviceSelector({
    super.key,
    required this.mediaService,
  });

  @override
  State<AudioDeviceSelector> createState() => _AudioDeviceSelectorState();
}

class _AudioDeviceSelectorState extends State<AudioDeviceSelector> {
  List<MediaDevice> _devices = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDevices();
  }

  Future<void> _loadDevices() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final devices = await widget.mediaService.getAudioDevices();

      if (mounted) {
        setState(() {
          _devices = devices;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to load audio devices: $e';
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _selectDevice(MediaDevice device) async {
    try {
      await widget.mediaService.selectAudioDevice(device.id);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Switched to ${device.label}'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to switch device: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Audio Devices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Content
            Flexible(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              _error!,
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadDevices,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_devices.isEmpty) {
      return const Center(
        child: Text(
          'No audio devices found',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    // Separate input and output devices
    final inputDevices = _devices
        .where((d) => d.type == MediaDeviceType.audioInput)
        .toList();
    final outputDevices = _devices
        .where((d) => d.type == MediaDeviceType.audioOutput)
        .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Microphones
          if (inputDevices.isNotEmpty) ...[
            const Text(
              'Microphones',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ...inputDevices.map((device) => _buildDeviceTile(device)),
            const SizedBox(height: 16),
          ],

          // Speakers
          if (outputDevices.isNotEmpty) ...[
            const Text(
              'Speakers',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ...outputDevices.map((device) => _buildDeviceTile(device)),
          ],
        ],
      ),
    );
  }

  Widget _buildDeviceTile(MediaDevice device) {
    final icon = device.type == MediaDeviceType.audioInput
        ? Icons.mic
        : Icons.volume_up;

    return InkWell(
      onTap: () => _selectDevice(device),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8),
          border: device.isDefault
              ? Border.all(color: Colors.blue, width: 2)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: device.isDefault ? Colors.blue : Colors.white70,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  if (device.isDefault)
                    const Text(
                      'Default',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            if (device.isDefault)
              const Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
