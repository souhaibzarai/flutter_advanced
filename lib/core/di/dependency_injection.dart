import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '/features/login/data/repos/login_repo.dart';
import '/features/login/logic/cubit/login_cubit.dart';
import '/features/sign_up/data/repos/sign_up_repo.dart';
import '/features/sign_up/logic/sign_up_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl<ApiService>()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));

  // Sign Up
  sl.registerLazySingleton<SignUpRepo>(() => SignUpRepo(sl<ApiService>()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl<SignUpRepo>()));
}
