import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class GDSegmentBtn extends StatelessWidget {
  const GDSegmentBtn({
    required this.currentValue,
    required this.onSelectionChanged,
    super.key,
  });

  final String currentValue;
  final void Function(String) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      selectedIcon: const Icon(
        Icons.circle_rounded,
        color: AppColors.pink,
      ),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      segments: const [
        ButtonSegment(
          value: 'OPEN',
          label: Text(
            'OPEN',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ButtonSegment(
          value: 'CLOSED',
          label: Text(
            'CLOSED',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ButtonSegment(
          value: 'HOLD',
          label: Text(
            'HOLD',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      selected: {currentValue},
      onSelectionChanged: (value) => onSelectionChanged(
        value.first,
      ),
    );
  }
}
