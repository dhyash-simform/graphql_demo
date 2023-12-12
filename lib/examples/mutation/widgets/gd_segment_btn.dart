import 'dart:async';

import 'package:flutter/material.dart';

import '../../../schemas/moon_high_way/operations/gql_operations.dart';
import '../../../values/app_colors.dart';

class GDSegmentBtn extends StatelessWidget {
  const GDSegmentBtn({
    required this.currentValue,
    required this.onSelectionChanged,
    super.key,
  });

  final EnumLiftStatus currentValue;
  final FutureOr<void> Function(EnumLiftStatus) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<EnumLiftStatus>(
      selectedIcon: const Icon(
        Icons.circle_rounded,
        color: AppColors.pink,
      ),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      segments: const [
        ButtonSegment(
          value: EnumLiftStatus.OPEN,
          label: Text(
            'OPEN',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ButtonSegment(
          value: EnumLiftStatus.CLOSED,
          label: Text(
            'CLOSED',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ButtonSegment(
          value: EnumLiftStatus.HOLD,
          label: Text(
            'HOLD',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      selected: {currentValue},
      onSelectionChanged: (value) async => await onSelectionChanged(
        value.first,
      ),
    );
  }
}
