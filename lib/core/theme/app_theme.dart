import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.lightSurface,
    shadowColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: TextStyle(
        color: AppColors.secondary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.primary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: AppColors.primary, fontSize: 16),
      titleSmall: TextStyle(color: AppColors.primary, fontSize: 12),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textPrimary, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.textPrimary, fontSize: 12),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: TextStyle(color: AppColors.secondary.withAlpha(100)),
      alignLabelWithHint: true,
      labelStyle: TextStyle(color: AppColors.secondary, fontSize: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary.withAlpha(100)),
        borderRadius: BorderRadius.circular(32),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary.withAlpha(100)),
        borderRadius: BorderRadius.circular(32),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withAlpha(300)),
        borderRadius: BorderRadius.circular(32),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
    ),
  );

  // dark them

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.lightSurface,
    shadowColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: TextStyle(
        color: AppColors.secondary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      titleSmall: TextStyle(color: AppColors.textPrimary, fontSize: 12),
      bodyLarge: TextStyle(
        color: AppColors.textPrimary.withAlpha(100),
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textPrimary.withAlpha(100),
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.textPrimary.withAlpha(100),
        fontSize: 12,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: TextStyle(color: AppColors.secondary.withAlpha(100)),
      alignLabelWithHint: true,
      labelStyle: TextStyle(color: AppColors.secondary, fontSize: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary.withAlpha(100)),
        borderRadius: BorderRadius.circular(32),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary.withAlpha(100)),
        borderRadius: BorderRadius.circular(32),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withAlpha(300)),
        borderRadius: BorderRadius.circular(32),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
    ),
  );
}
