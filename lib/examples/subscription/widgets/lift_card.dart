import 'package:flutter/material.dart';
import 'package:graphql_demo/values/app_colors.dart';

class LiftCard extends StatelessWidget {
  const LiftCard({
    required this.liftName,
    required this.liftStatus,
    super.key,
  });

  final String liftName;
  final String liftStatus;

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      liftName,
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
                            text: liftStatus,
                            style: const TextStyle(color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
