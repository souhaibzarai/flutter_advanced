import 'package:flutter/material.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/styles.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/home-blue-pattern.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(48),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font12PrimaryRegular,
                    ), //
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 0,
            child: Image.asset('assets/images/doctor-img.png', height: 200),
          ),
        ],
      ), //
    );
  }
}
