import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/theme/theme_extension.dart';
import 'package:mom_plus/core/utils/enums/pop_up_status.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vibration/vibration.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  CustomColors get themeExtension => theme.extension<CustomColors>()!;

  Brightness get brightness => theme.brightness;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  double get maxScale => max(textScaler.scale(1), 1);

  double scaled(double base) => textScaler.scale(base);

  Future<void> showPopUp({
    required PopUpStatus status,
    required String message,
    Widget? child,
    double? height,
    Duration? displayDuration,
    Duration? animationDuration,
    Duration? reverseAnimationDuration,
    DismissType? dismissType,
    TextStyle? messageStyle,
    required BuildContext context,
  }) async {
    if (status == PopUpStatus.error || status == PopUpStatus.warning) {
      if (Platform.isIOS) {
        await HapticFeedback.lightImpact();
      } else {
        await Vibration.vibrate(duration: 200, amplitude: 64);
      }
    }
    AnimationController? localAnimationController;
    showTopSnackBar(
      Overlay.of(this),
      child ??
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4).copyWith(right: 0),
            height: height,
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F24).withOpacity(.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SvgPicture.asset(status.icon),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message,
                    style:
                        messageStyle ??
                        textTheme.bodySmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                AnimatedButton(
                  onTap: () {
                    if (localAnimationController != null) {
                      localAnimationController!.reverse();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(Icons.cancel_outlined, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
      displayDuration: displayDuration ?? const Duration(milliseconds: 2100),
      dismissDirection: [DismissDirection.vertical, DismissDirection.horizontal],
      dismissType: dismissType ?? DismissType.onTap,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeIn,
      onAnimationControllerInit: (p0) => localAnimationController = p0,
      animationDuration: animationDuration ?? const Duration(milliseconds: 400),
      reverseAnimationDuration: reverseAnimationDuration ?? const Duration(milliseconds: 300),
    );
  }
}
