import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/extensions.dart';
import 'core/helpers/shared_prefs_helper.dart';
import 'core/routes/app_router.dart';
import 'doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await checkIfUserIsLoggedIn();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfUserIsLoggedIn() async {
  String userToken = await SharedPrefsHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
