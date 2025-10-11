import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/colors.dart';
import '/core/theming/styles.dart';
import '../../../data/models/specializations_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, required this.doctorsModel});

  final DoctorsModel? doctorsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const DoctorCachedImage(),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? 'Doctor',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                  style: TextStyles.font12SecondaryMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorsModel?.email ?? 'Email',
                  style: TextStyles.font12SecondaryMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCachedImage extends StatelessWidget {
  const DoctorCachedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://i.pinimg.com/736x/f2/f6/72/f2f672b928ff6c3504e54d5caaa0d494.jpg',
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: ColorsManager.lightGray,
          highlightColor: Colors.white,
          child: Container(
            height: 120,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      imageBuilder: (context, imageProvider) => Container(
        width: 110,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
