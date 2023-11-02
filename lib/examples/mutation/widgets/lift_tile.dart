import 'package:flutter/material.dart';

import '../../../model/lift.dart';
import '../../../values/app_colors.dart';

class LiftTile extends StatelessWidget {
  const LiftTile({
    required this.lift,
    required this.onSelected,
    super.key,
  });

  final Lift lift;
  final void Function(String, String) onSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: AppColors.black,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      lift.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Status: ',
                        children: [
                          TextSpan(
                            text: lift.status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  onSelected: (value) => onSelected(lift.id, value),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'OPEN',
                        child: Text('OPEN'),
                      ),
                      const PopupMenuItem(
                        value: 'CLOSED',
                        child: Text('CLOSED'),
                      ),
                      const PopupMenuItem(
                        value: 'HOLD',
                        child: Text('HOLD'),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
