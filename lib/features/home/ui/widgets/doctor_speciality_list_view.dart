import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/theming/styles.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightPrimaryColor,
                  child: SvgPicture.asset(
                    'assets/svgs/general-speciality.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
                verticalSpace(12),
                Text('General', style: TextStyles.font12DarkBlueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
