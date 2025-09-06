import 'package:flutter/material.dart';

import '../helpers/font_weight_helper.dart';
import 'colors.dart';

class TextStyles {
  static const TextStyle font24BlackBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static const TextStyle font32PrimaryBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle font14SecondaryRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondaryColor,
  );

  static const TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static const TextStyle font24PrimaryBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle font14LightSecondaryRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightSecondary,
  );

  static const TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );

  static const TextStyle font13BlueRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle font13SecondaryRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondaryColor,
  );

  static const TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );

  static const TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkBlue,
  );
}
