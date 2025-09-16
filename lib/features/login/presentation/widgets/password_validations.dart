import 'package:flutter/material.dart';

import '/core/widgets/custom_validation.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomValidation(
          text: 'At least 1 lowercase letter',
          isValid: hasLowerCase,
        ),
        CustomValidation(
          text: 'At least 1 uppercase letter',
          isValid: hasUpperCase,
        ),
        CustomValidation(
          text: 'At least 1 special character',
          isValid: hasSpecialCharacter,
        ),
        CustomValidation(text: 'At least 1 number', isValid: hasNumber),
        CustomValidation(
          text: 'At least 8 characters long',
          isValid: hasMinLength,
        ),
      ],
    );
  }
}
