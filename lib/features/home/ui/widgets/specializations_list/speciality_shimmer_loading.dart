import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/widgets/custom_app_text_shimmer.dart';

class SpecialityShimmerLoading extends StatelessWidget {
  const SpecialityShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                  ),
                ),
                verticalSpace(12),
                const CustomAppTextShimmer(height: 14, width: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
