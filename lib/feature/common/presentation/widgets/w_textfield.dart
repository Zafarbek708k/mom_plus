import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';

class WTextField extends StatefulWidget {
  final bool? hasSearch;
  final bool? hasBorderColor;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validate;
  final bool? hasClearButton;
  final String title;
  final Color? disabledBorderColor;
  final double borderRadius;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;
  final TextStyle? counterStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final TextStyle? prefixStyle;
  final String prefixText;
  final String suffixText; // Added for right side text
  final TextStyle? suffixTextStyle; // Added for right side text style
  final bool? hideCounterText;
  final Widget? prefix;
  final EdgeInsets? prefixPadding;
  final double? width;
  final double? height;
  final double? topPrefixPadding;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final bool? isObscure;
  final Widget? suffix;
  final String? suffixIcon;
  final EdgeInsets? suffixPadding;
  final TextCapitalization textCapitalization;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final EdgeInsets? contentPadding;
  final bool hasError;
  final double sizeBetweenFieldTitle;
  final Color? errorColor;
  final Color? fillColor;
  final EdgeInsets? margin;
  final VoidCallback? onEyeTap;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function? onObscure;
  final Function? onTapSuffix;
  final Function()? onEditCompleted;
  final Function()? onTap;
  final bool autoFocus;
  final Color? disabledColor;
  final double? suffixRightPosition;
  final double? suffixSize;
  final int? maxLines;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusColor;
  final BorderRadius? detailedBorderRadius;
  final bool readOnly;
  final Widget? suffixTitleWidget;
  final String hintNextToTitle;
  final String? initial;
  final TextStyle? hintNextToTitleStyle;
  final Color? cursorColor;
  final List<BoxShadow>? boxShadow;
  final FloatingLabelAlignment floatingLabelAlignment;
  final Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})?
  buildCounter;

  const WTextField({
    this.controller,
    required this.onChanged,
    this.hasBorderColor,
    this.topPrefixPadding,
    this.readOnly = false,
    this.disabledColor,
    this.validate,
    this.boxShadow,
    this.autoValidateMode,
    this.hideCounterText,
    this.autoFocus = false,
    this.borderRadius = 8,
    this.prefixStyle,
    this.disabledBorderColor,
    this.hasClearButton,
    this.textAlign = TextAlign.start,
    this.width,
    this.fillColor,
    this.title = '',
    this.titleTextStyle,
    this.label,
    this.labelText,
    this.labelTextStyle,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.prefixText = '',
    this.suffixText = '', // Added
    this.suffixTextStyle, // Added
    this.prefix,
    this.prefixPadding = const EdgeInsets.all(2),
    this.suffix,
    this.suffixIcon,
    this.suffixPadding = const EdgeInsets.all(8),
    this.isObscure,
    this.onEyeTap,
    this.margin,
    this.sizeBetweenFieldTitle = 4,
    this.errorColor,
    this.hasError = false,
    this.textInputFormatters,
    this.floatingLabelAlignment = FloatingLabelAlignment.start,
    this.textCapitalization = TextCapitalization.none,
    this.keyBoardType,
    this.maxLength,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.height,
    this.onObscure,
    this.onTapSuffix,
    super.key,
    this.onEditCompleted,
    this.onTap,
    this.suffixRightPosition,
    this.suffixSize,
    this.maxLines = 1,
    this.borderColor,
    this.enabledBorderColor,
    this.detailedBorderRadius,
    this.focusColor = AppColors.white,
    this.suffixTitleWidget,
    this.hintNextToTitle = '',
    this.hasSearch,
    this.cursorColor = AppColors.darkBlue,
    this.hintNextToTitleStyle,
    this.counterStyle,
    this.buildCounter,
    this.initial,
  });

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> {
  late FocusNode focusNode;
  bool focused = false;
  bool hasText = false;
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    if (widget.isObscure != null) {
      isObscure = widget.isObscure!;
    }
    focusNode = widget.focusNode ?? FocusNode();

    focusNode.addListener(
      () => setState(() {
        focused = focusNode.hasFocus;
      }),
    );
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasPrefixText = widget.prefixText.isNotEmpty;
    final bool hasSuffixText = widget.suffixText.isNotEmpty;

    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style:
                          widget.titleTextStyle ??
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.darkBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    if (widget.hintNextToTitle.isNotEmpty)
                      Text(
                        ' ${widget.hintNextToTitle}',
                        style:
                            widget.hintNextToTitleStyle ??
                            Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                  ],
                ),
                if (widget.suffixTitleWidget != null) widget.suffixTitleWidget!,
              ],
            ),
          if (widget.title.isNotEmpty) SizedBox(height: widget.sizeBetweenFieldTitle),
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(widget.borderRadius),
              boxShadow: widget.boxShadow,
            ),
            child: Row(
              children: [
                // Left side text (prefix)
                if (hasPrefixText)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: widget.fillColor ?? Colors.transparent,
                      border: Border.all(color: _getBorderColor(), width: 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.borderRadius),
                        bottomLeft: Radius.circular(widget.borderRadius),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.prefixText,
                        style:
                            widget.prefixStyle ??
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.darkBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                // Text field
                Expanded(
                  child: ClipRRect(
                    borderRadius: _getTextFieldBorderRadius(hasPrefixText, hasSuffixText),
                    child: TextFormField(
                      keyboardAppearance: context.theme.brightness,
                      cursorWidth: 1,
                      buildCounter: widget.buildCounter,
                      cursorRadius: const Radius.circular(1),
                      autovalidateMode: widget.autoValidateMode,
                      validator: widget.validate,
                      maxLines: widget.maxLines,
                      onTap: widget.onTap,
                      initialValue: widget.initial,
                      readOnly: widget.readOnly,
                      textAlign: widget.textAlign,
                      inputFormatters: widget.textInputFormatters,
                      textInputAction: widget.textInputAction,
                      textCapitalization: widget.textCapitalization,
                      obscureText: isObscure,
                      keyboardType: widget.keyBoardType,
                      maxLength: widget.maxLength,
                      controller: widget.controller,
                      autofocus: widget.autoFocus,
                      cursorColor: widget.cursorColor,
                      obscuringCharacter: '●',
                      cursorHeight: 18,
                      onEditingComplete: widget.onEditCompleted,
                      onChanged: (s) {
                        if (s.length == 1 || s.isEmpty) {
                          setState(() => hasText = s.isNotEmpty);
                        }
                        widget.onChanged(s);
                      },
                      focusNode: focusNode,
                      style:
                          widget.textStyle ??
                          Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        label: widget.label,
                        labelText: widget.labelText,
                        labelStyle: widget.labelTextStyle,
                        floatingLabelAlignment: widget.floatingLabelAlignment,
                        counterText: widget.hideCounterText == true ? '' : null,
                        counterStyle: widget.counterStyle,
                        hintText: widget.hintText,
                        hintStyle:
                            widget.hintTextStyle ??
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                        filled: true,
                        fillColor:
                            focused
                                ? widget.focusColor
                                : widget.disabledColor != null && !focused
                                ? widget.controller != null && widget.controller!.text.isNotEmpty
                                    ? widget.fillColor ?? Colors.transparent
                                    : widget.disabledColor
                                : widget.fillColor ?? Colors.transparent,
                        contentPadding: widget.contentPadding,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(width: 1, color: _getBorderColor()),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(width: 1, color: _getBorderColor()),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(width: 1, color: _getBorderColor()),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(width: 1, color: _getBorderColor()),
                        ),
                      ),
                    ),
                  ),
                ),
                // Right side text (suffix)
                if (hasSuffixText)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: widget.fillColor ?? Colors.transparent,
                      border: Border.all(color: _getBorderColor(), width: 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(widget.borderRadius),
                        bottomRight: Radius.circular(widget.borderRadius),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.suffixText,
                        style:
                            widget.suffixTextStyle ??
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor() {
    if (widget.hasError) {
      return widget.errorColor ?? AppColors.darkRed;
    }
    if (focused) {
      return widget.borderColor ?? AppColors.darkBlue;
    }
    if (widget.hasBorderColor != null && widget.hasBorderColor!) {
      return widget.borderColor ?? AppColors.gray.withValues(alpha: 0.3);
    }
    return widget.enabledBorderColor ?? AppColors.gray.withValues(alpha: 0.3);
  }

  BorderRadius _getTextFieldBorderRadius(bool hasPrefix, bool hasSuffix) {
    if (hasPrefix && hasSuffix) {
      return BorderRadius.zero;
    } else if (hasPrefix) {
      return BorderRadius.only(
        topRight: Radius.circular(widget.borderRadius),
        bottomRight: Radius.circular(widget.borderRadius),
      );
    } else if (hasSuffix) {
      return BorderRadius.only(
        topLeft: Radius.circular(widget.borderRadius),
        bottomLeft: Radius.circular(widget.borderRadius),
      );
    }
    return BorderRadius.circular(widget.borderRadius);
  }
}
