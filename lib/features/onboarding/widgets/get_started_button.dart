import 'package:flutter/material.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theming/colors.dart';
import '/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsManager.primaryColor),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(const Size(double.infinity, 56)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),
      child: const Text('Get Started', style: TextStyles.font16WhiteSemiBold),
    );
  }
}
