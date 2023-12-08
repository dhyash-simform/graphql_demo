import 'package:flutter/material.dart';

import '../../../schemas/moon_high_way/generated/moon_high_way.schema.graphql.dart';
import '../../../values/app_colors.dart';

class LiftTile extends StatelessWidget {
  const LiftTile({
    required this.onSelected,
    required this.name,
    required this.status,
    super.key,
  });

  final String name;
  final String status;
  final void Function(EnumLiftStatus) onSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
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
                      name,
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
                            text: status,
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
                  onSelected: onSelected,
                  itemBuilder: (_) {
                    return [
                      const PopupMenuItem(
                        value: EnumLiftStatus.OPEN,
                        child: Text('OPEN'),
                      ),
                      const PopupMenuItem(
                        value: EnumLiftStatus.CLOSED,
                        child: Text('CLOSED'),
                      ),
                      const PopupMenuItem(
                        value: EnumLiftStatus.HOLD,
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
