import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/theme_extension.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  CustomColors get themeExtension => theme.extension<CustomColors>()!;

  //
  // ThemedShadows get themeShadow => theme.extension<ThemedShadows>()!;
  //
  // ThemedIcons get themeIcons => theme.extension<ThemedIcons>()!;

  Brightness get brightness => theme.brightness;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  double get maxScale => max(textScaler.scale(1), 1);

  double scaled(double base) => textScaler.scale(base);
}
