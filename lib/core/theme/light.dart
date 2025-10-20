import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/theme/theme_extension.dart';

abstract class LightTheme {
  static ThemeData theme() => ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
    textTheme: const TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    ),
    extensions: [CustomColors.light],
  );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const displayMedium = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const headlineLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const headlineMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  );
  static const headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  );
  static const titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const bodyMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const labelMedium = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  ); //
  static const labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    letterSpacing: 0,
    height: 1.3,
  );
}
