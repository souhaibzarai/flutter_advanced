import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/home/logic/home_cubit.dart';
import '/features/home/logic/home_state.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/specializations_response_model.dart';
import '../widgets/doctor_speciality_list_view.dart';
import '../widgets/doctors_list_view.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

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

          specializationsSuccess: (specializationsResponseModel) {
            var specializationDataList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationDataList);
          },

          specializationsError: (errorHandler) => setupError(),

          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationDataList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(
            specializationsDataList: specializationDataList ?? [],
          ),
          verticalSpace(16),
          DoctorsListView(
            doctorsList: specializationDataList?.first?.doctorsList ?? [],
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
