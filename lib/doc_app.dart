import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';
import 'core/theming/colors.dart';

import 'core/routes/routes.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;

  const DocApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc App',
      theme: ThemeData(
        primaryColor: ColorsManager.primaryColor,
        scaffoldBackgroundColor: ColorsManager.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.onBoardingScreen,
    );
  }
}
