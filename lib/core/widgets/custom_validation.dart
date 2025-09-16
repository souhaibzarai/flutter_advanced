import 'package:flutter/material.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/theming/styles.dart';

class CustomValidation extends StatelessWidget {
  const CustomValidation({
    super.key,
    required this.text,
    required this.isValid,
  });

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2,
          backgroundColor: isValid
              ? Colors.green
              : ColorsManager.secondaryColor,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font14SecondaryRegular.copyWith(
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationThickness: isValid ? 3 : null,
            decorationColor: isValid
                ? Colors.green
                : ColorsManager.secondaryColor,
          ),
        ),
      ],
    );
  }
}
