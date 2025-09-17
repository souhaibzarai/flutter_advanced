import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/helpers/app_regex.dart';
import '/core/helpers/spacing.dart';
import '/core/widgets/app_text_form_field.dart';
import '../../../login/presentation/widgets/password_validations.dart';
import '../../logic/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
    passwordConfirmationController = context
        .read<SignUpCubit>()
        .passwordConfirmationController;
    setupPasswordControllerListener();
    super.initState();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    passwordConfirmationController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (name) {
              if (name.isEmpty || name.length < 3) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Phone',
            validator: (phone) {
              if (!AppRegex.isPhoneNumberValid(phone)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Email',
            validator: (email) {
              if (email.isEmpty || !AppRegex.isEmailValid(email)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            controller: passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: onVisibilityIconClicked,
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (password) {
              if (password.isEmpty ||
                  !AppRegex.hasLowerCase(password) ||
                  !AppRegex.hasUpperCase(password) ||
                  !AppRegex.hasNumber(password) ||
                  !AppRegex.hasSpecialCharacter(password) ||
                  !AppRegex.hasMinLength(password)) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isObscureText,
            validationMode: AutovalidateMode.onUnfocus,
            suffixIcon: GestureDetector(
              onTap: onVisibilityIconClicked,
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (passwordConfirmation) {
              if (!(passwordConfirmation == passwordController.text)) {
                return 'Password doesn\'t match';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  void onVisibilityIconClicked() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }
}
