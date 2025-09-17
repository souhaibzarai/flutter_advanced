import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/helpers/spacing.dart';
import '/core/theming/styles.dart';
import '/core/widgets/app_text_button.dart';
import '../../login/presentation/widgets/terms_and_conditions_text.dart';
import '../logic/sign_up_cubit.dart';
import 'widgets/already_have_account.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: TextStyles.font24PrimaryBold),
              verticalSpace(8),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyles.font14SecondaryRegular.copyWith(height: 1.8),
              ),
              verticalSpace(32),
              Column(
                children: [
                  const SignUpForm(),
                  verticalSpace(48),
                  AppTextButton(
                    text: 'Create Account',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenSignUp(context);
                    },
                  ),
                  verticalSpace(16),
                  const TermsAndConditionsText(),
                  verticalSpace(48),
                  const AlreadyHaveAccount(),
                  const SignUpBlocListener(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpState();
    }
  }
}
