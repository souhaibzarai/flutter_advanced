import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/theming/styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hi, Souhaib!', style: TextStyles.font18DarkBlueBold),
              verticalSpace(8),
              const Text(
                'How Are you Today?',
                style: TextStyles.font13ExtraLightSecondaryRegular,
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.lightGray,
          radius: 26,
          child: SvgPicture.asset('assets/svgs/notification.svg'),
        ),
      ],
    );
  }
}
