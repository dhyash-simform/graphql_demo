import 'package:flutter/material.dart';

class GqlLoading extends StatelessWidget {
  const GqlLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RepaintBoundary(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
