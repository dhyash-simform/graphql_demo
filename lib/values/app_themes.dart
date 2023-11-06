import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.black,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        elevation: 10,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      unselectedItemColor: Colors.white30,
      elevation: 0,
    ),
    useMaterial3: true,
  );
}
