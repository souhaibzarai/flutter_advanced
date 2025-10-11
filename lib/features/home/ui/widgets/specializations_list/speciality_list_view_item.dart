import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/theming/styles.dart';
import '../../../data/models/specializations_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    required this.specialization,
    required this.itemIndex,
    required this.selectedIndex,
  });

  final SpecializationsData? specialization;
  final int itemIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: selectedIndex == itemIndex
                ? BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  )
                : null,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: ColorsManager.lightPrimaryColor,
              child: SvgPicture.asset(
                'assets/svgs/general-speciality.svg',
                height: 40,
                width: 40,
              ),
            ),
          ),
          verticalSpace(12),
          Text(
            specialization?.name ?? 'Specialization',
            style: selectedIndex == itemIndex
                ? TextStyles.font12DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
