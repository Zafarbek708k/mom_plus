import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/app_colors.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? whiteToDark;
  final Color? text;
  final Color? danger;

  const CustomColors({required this.whiteToDark, required this.danger, required this.text});

  @override
  ThemeExtension<CustomColors> copyWith({Color? whiteToDark, Color? text, Color? danger}) {
    return CustomColors(
      whiteToDark: whiteToDark ?? this.whiteToDark,
      danger: danger ?? this.danger,
      text: text ?? this.text,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      whiteToDark: Color.lerp(whiteToDark, other.whiteToDark, t),
      danger: Color.lerp(danger, other.danger, t),
      text: Color.lerp(text, other.text, t),
    );
  }

  @override
  String toString() =>
      'CustomColors('
      'info: $text, warning: $text, danger: $danger'
      ')';

  static CustomColors light = CustomColors(
    whiteToDark: AppColors.white,
    danger: AppColors.darkRed,
    text: AppColors.darkBlue,
  );
  static CustomColors dark = CustomColors(
    whiteToDark: AppColors.darkGrey,
    danger: AppColors.darkRed,
    text: AppColors.white,
  );
}
