import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/home/logic/home_cubit.dart';
import '/features/home/logic/home_state.dart';
import '/../core/helpers/extensions.dart';
import '/../core/helpers/spacing.dart';
import '../../../data/models/specializations_response_model.dart';
import '../doctors_list/doctors_shimmer_loading.dart';
import 'speciality_list_view.dart';
import 'speciality_shimmer_loading.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),

          specializationsSuccess: (specializationsDataList) {
            return setupSuccess(specializationsDataList);
          },

          specializationsError: (apiErrorModel) =>
              setupError(context, message: apiErrorModel.getAllErrorMessages()),

          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  /// Setup loading shimmer for both specializations and doctors.
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationDataList) {
    return SpecialityListView(
      specializationsDataList: specializationDataList ?? [],
    );
  }

  setupError(BuildContext context, {required String message}) {
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
