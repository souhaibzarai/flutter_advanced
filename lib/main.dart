import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/doc_app.dart';

import 'core/routes/app_router.dart';

void main() {
  initDependencies();
  runApp(DocApp(appRouter: AppRouter()));
}
