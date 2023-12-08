import 'package:flutter/material.dart';

import 'modules/home/home_screen.dart';
import 'values/app_themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Demo App',
      theme: AppThemes.theme,
      home: const HomeScreen(),
    );
  }
}
