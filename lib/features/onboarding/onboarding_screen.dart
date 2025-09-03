import 'package:flutter/material.dart';
import '../../core/theming/styles.dart';
import 'widgets/doctor_image_and_text.dart';
import 'widgets/get_started_button.dart';

import 'widgets/doc_logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.only(top: 32, bottom: 32),
            child: Column(
              children: [
                const DocLogoAndName(),
                const SizedBox(height: 32),
                const DoctorImageAndText(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font14SecondaryRegular,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
