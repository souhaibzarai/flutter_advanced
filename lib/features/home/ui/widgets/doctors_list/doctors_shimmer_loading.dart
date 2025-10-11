import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/widgets/custom_app_text_shimmer.dart';

class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 110,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppTextShimmer(height: 16),
                      verticalSpace(12),
                      const CustomAppTextShimmer(height: 12),
                      verticalSpace(12),
                      const CustomAppTextShimmer(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ), //
    );
  }
}
