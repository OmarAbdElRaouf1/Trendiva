import 'package:flutter_test/flutter_test.dart';

import 'package:trendiva/main.dart';

void main() {
  testWidgets('App boots and shows the login screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(Trendiva());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Email Address'), findsOneWidget);
  });
}
