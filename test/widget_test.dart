import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/main.dart';

void main() {
  testWidgets('App boots and shows the login screen', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await setupServiceLocator();
    await tester.pumpWidget(Trendiva());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Email Address'), findsOneWidget);
  });
}
