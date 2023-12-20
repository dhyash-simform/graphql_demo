import 'dart:developer';

import 'package:flutter/material.dart';

class GqlError extends StatelessWidget {
  const GqlError({required this.error, super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    log(error, name: 'Exception');
    return Center(
      child: Text(error, style: const TextStyle(color: Colors.white)),
    );
  }
}
