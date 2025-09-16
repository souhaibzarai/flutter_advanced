import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsets? padding;
  final String hintText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Function(String value) validator;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    this.padding,
    required this.hintText,
    this.focusedBorder,
    this.enabledBorder,
    this.backgroundColor,
    this.suffixIcon,
    this.isObscureText,
    this.hintStyle,
    this.textStyle,
    required this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.3,
                color: ColorsManager.primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.3,
                color: ColorsManager.lighterSecondary,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.3, color: Colors.red),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.3, color: Colors.red.withAlpha(180)),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightSecondaryRegular,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsManager.extraLighterSecondary,
        filled: true,
      ),
      controller: controller,
      validator: (value) => validator(value!),
      obscureText: isObscureText ?? false,
      style: textStyle ?? TextStyles.font14DarkBlueMedium,
    );
  }
}
