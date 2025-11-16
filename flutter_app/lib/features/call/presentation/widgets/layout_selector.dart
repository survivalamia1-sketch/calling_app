import 'package:flutter/material.dart';

import '../../domain/entities/meeting_layout.dart';

/// Bottom sheet for selecting meeting layout mode
class LayoutSelector extends StatelessWidget {
  final MeetingLayout currentLayout;
  final Function(MeetingLayout layout)? onLayoutChanged;

  const LayoutSelector({
    super.key,
    required this.currentLayout,
    this.onLayoutChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.view_comfortable, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Layout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.white12, height: 1),

            // Layout options
            _LayoutOption(
              layout: MeetingLayout.gallery,
              icon: Icons.grid_view,
              isSelected: currentLayout == MeetingLayout.gallery,
              onTap: () {
                onLayoutChanged?.call(MeetingLayout.gallery);
                Navigator.pop(context);
              },
            ),
            _LayoutOption(
              layout: MeetingLayout.speaker,
              icon: Icons.person,
              isSelected: currentLayout == MeetingLayout.speaker,
              onTap: () {
                onLayoutChanged?.call(MeetingLayout.speaker);
                Navigator.pop(context);
              },
            ),
            _LayoutOption(
              layout: MeetingLayout.pinned,
              icon: Icons.push_pin,
              isSelected: currentLayout == MeetingLayout.pinned,
              onTap: () {
                onLayoutChanged?.call(MeetingLayout.pinned);
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _LayoutOption extends StatelessWidget {
  final MeetingLayout layout;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _LayoutOption({
    required this.layout,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      layout.displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      layout.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Selected indicator
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
