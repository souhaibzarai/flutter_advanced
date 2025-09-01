import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routes/app_router.dart';

import 'core/routes/routes.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;

  const DocApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.onBoardingScreen,
    );
  }
}
