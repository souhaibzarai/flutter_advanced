import 'package:flutter_advanced/core/routes/app_router.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(DocApp(appRouter: AppRouter()));
  });
}
