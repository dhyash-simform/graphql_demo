import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black,
                  AppColors.blue,
                  AppColors.pink,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
