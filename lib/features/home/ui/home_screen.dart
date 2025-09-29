import 'package:flutter/material.dart';

import 'widgets/doctors_blue_container.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const HomeAppBar(), //
                const DoctorsBlueContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
