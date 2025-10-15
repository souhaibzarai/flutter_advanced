import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/networking/api_result.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/networking/api_error_handler.dart';
import '../data/models/specializations_response_model.dart';
import '../data/repository/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(HomeState.specializationsLoading());
    final result = await _homeRepo.getSpecializations();

    result.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(HomeState.specializationsSuccess(specializationsList));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationsError(apiErrorModel));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<DoctorsModel?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ApiErrorHandler.handle('No Doctors Found')));
    }
  }

  /// returns the List of doctors based on the specialization id.
  List<DoctorsModel?>? getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization!.id == specializationId)
        ?.doctorsList;
  }
}
