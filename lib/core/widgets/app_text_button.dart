import 'package:flutter/material.dart';

import '../theming/colors.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonHeight;
  final double? buttonWidth;

  const AppTextButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.onPressed,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadiusGeometry.circular(16),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(
          backgroundColor ?? ColorsManager.primaryColor,
        ),
        padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsetsGeometry.symmetric(
            horizontal: horizontalPadding ?? 12,
            vertical: verticalPadding ?? 14,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 56),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
