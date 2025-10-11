import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors.dart';

class CustomAppTextShimmer extends StatelessWidget {
  const CustomAppTextShimmer({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = 16,
  });

  final double height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.lightGray,
      highlightColor: Colors.white,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorsManager.lightGray,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
