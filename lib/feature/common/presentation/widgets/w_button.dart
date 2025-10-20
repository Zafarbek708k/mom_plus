import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color? disabledColor;
  final Color disabledTextColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;
  final Color circularColor;
  final Color cupertinoCircularColor;

  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.color,
    this.disabledTextColor = AppColors.gray,
    this.textColor = AppColors.textColor,
    this.borderRadius = 12,
    this.disabledColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    super.key,
    this.circularColor = AppColors.white,
    this.cupertinoCircularColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      scaleValue: scaleValue ?? 0.98,
      onTap: () {
        if (!(isLoading || isDisabled)) {
          onTap();
        }
      },
      isDisabled: isLoading || isDisabled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: context.scaled(height ?? 44),
        margin: margin,
        padding: padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? disabledColor ?? context.themeExtension.whiteToDark : color ?? AppColors.pink,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          gradient:
              isDisabled
                  ? null
                  : color != null
                  ? null
                  : (gradient),
          boxShadow: shadow,
        ),
        child:
            isLoading
                ? Center(
                  child: Transform.scale(
                    scale: 0.8,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(circularColor),
                      backgroundColor: Platform.isAndroid ? AppColors.pink : cupertinoCircularColor,
                      strokeWidth: 2.5,
                    ),
                  ),
                )
                : AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: context.textTheme.headlineLarge!.copyWith(
                    height: 1.36,
                    color: isDisabled ? disabledTextColor : textColor,
                  ),
                  child:
                      child ??
                      Text(
                        text,
                        style:
                            textStyle ??
                            context.textTheme.headlineLarge!.copyWith(
                              height: 1.36,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isDisabled ? disabledTextColor : textColor,
                            ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                ),
      ),
    );
  }
}
