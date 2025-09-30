import 'package:flutter/material.dart';

import '/core/helpers/spacing.dart';
import 'widgets/doctor_speciality_list_view.dart';
import 'widgets/doctors_blue_container.dart';
import 'widgets/doctors_list_view.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              const DoctorSpecialityListView(),
              verticalSpace(16),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
