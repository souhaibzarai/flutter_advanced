import '../helpers/constants.dart';
import '../helpers/shared_prefs_helper.dart';
import '../networking/dio_factory.dart';

class AppFunctions {
  const AppFunctions._();

  static Future<void> saveUserToken(String token) async {
    await SharedPrefsHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
