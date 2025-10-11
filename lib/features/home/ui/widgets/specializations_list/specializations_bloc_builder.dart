import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/home/logic/home_cubit.dart';
import '/features/home/logic/home_state.dart';
import '../../../data/models/specializations_response_model.dart';
import 'speciality_list_view.dart';

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

          specializationsError: (errorHandler) => setupError(),

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

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
