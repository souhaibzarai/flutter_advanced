import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/features/home/data/api/home_api_services.dart';
import '../models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;

  const HomeRepo(this._homeApiServices);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    final response = await _homeApiServices.getSpecializations();

    try {
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
