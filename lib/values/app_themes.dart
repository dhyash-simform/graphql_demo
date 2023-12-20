import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static final theme = ThemeData.dark().copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.black,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        elevation: 10,
        backgroundColor: AppColors.black,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.black,
      unselectedItemColor: Colors.white30,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}
