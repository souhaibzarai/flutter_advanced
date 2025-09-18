import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/routes/app_router.dart';
import 'doc_app.dart';

void main() {
  initDependencies();
  runApp(DocApp(appRouter: AppRouter()));
}
