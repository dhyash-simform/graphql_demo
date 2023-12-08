import 'package:flutter/material.dart';

import '../../../schemas/moon_high_way/generated/moon_high_way.schema.graphql.dart';
import '../../../values/app_colors.dart';

class GDSegmentBtn extends StatelessWidget {
  const GDSegmentBtn({
    required this.currentValue,
    required this.onSelectionChanged,
    super.key,
  });

  final EnumLiftStatus currentValue;
  final void Function(EnumLiftStatus) onSelectionChanged;

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
      onSelectionChanged: (value) => onSelectionChanged(
        value.first,
      ),
    );
  }
}
