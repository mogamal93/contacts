import 'package:contact/theme/AppColors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.gold,
  );

  static ThemeData theme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.darkBlue,

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.gold,
      onPrimary: AppColors.darkBlue,
      secondary: AppColors.gold,
      onSecondary: AppColors.darkBlue,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.darkBlue,
      onSurface: AppColors.gold,
    ),

    textTheme: const TextTheme(
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      bodySmall: bodySmall,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.darkBlue,

        minimumSize: const Size(double.infinity, 50),

        padding: const EdgeInsets.all(16),

        elevation: 0,

        overlayColor: Colors.transparent,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(

      filled: true,
      fillColor: AppColors.darkBlue,

      hintStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.lightBlue,
        fontWeight: FontWeight.normal,
      ),

      contentPadding: const EdgeInsets.all(16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.gold,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.gold,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.gold,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.red,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.red,
        ),
      ),
    ),
  );
}