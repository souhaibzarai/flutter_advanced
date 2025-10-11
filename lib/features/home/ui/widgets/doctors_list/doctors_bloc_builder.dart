import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/specializations_response_model.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctors) => setupSuccess(doctors),
          doctorsError: (errorHandler) => setupError(errorHandler),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<DoctorsModel?>? doctors) {
    return DoctorsListView(doctorsList: doctors ?? []);
  }

  Widget setupError(ErrorHandler errorHandler) {
    return const SizedBox.shrink();
  }
}
