import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';

class TextStyles {
  static const TextStyle font24BlackWeight700 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle font32PrimaryBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle font14SecondaryRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorsManager.secondaryColor,
  );

  static const TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
