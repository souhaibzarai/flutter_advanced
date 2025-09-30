import 'package:flutter/material.dart';

import '../helpers/font_weight_helper.dart';
import 'colors.dart';

class TextStyles {
  const TextStyles._();

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

  static const TextStyle font18DarkBlueBold = TextStyle(
    fontSize: 18,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.bold,
  );

  static const TextStyle font13ExtraLightSecondaryRegular = TextStyle(
    fontSize: 13,
    color: ColorsManager.xLightSecondary,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static const TextStyle font12PrimaryRegular = TextStyle(
    fontSize: 12,
    color: ColorsManager.primaryColor,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle font12DarkBlueRegular = TextStyle(
    fontSize: 12,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.regular,
  );

  static const TextStyle font18DarkBlueSemiBold = TextStyle(
    fontSize: 18,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.semiBold,
  );

  static const TextStyle font12SecondaryMedium = TextStyle(
    fontSize: 12,
    color: ColorsManager.secondaryColor,
    fontWeight: FontWeightHelper.medium,
  );
}
