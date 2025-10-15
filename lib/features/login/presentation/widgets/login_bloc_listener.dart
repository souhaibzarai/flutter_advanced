import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/helpers/extensions.dart';
import '/core/routes/routes.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              widthFactor: 40,
              heightFactor: 40,
              child: CircularProgressIndicator(),
            ),
          ),
          loginSuccess: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          loginError: (apiErrorModel) => setupErrorState(
            context,
            message: apiErrorModel.getAllErrorMessages(),
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  setupErrorState(BuildContext context, {required String message}) {
    context.pop();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Icon(Icons.error, color: Colors.red, size: 40),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(message),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
          // content: ,
        );
      },
    );
  }
}
