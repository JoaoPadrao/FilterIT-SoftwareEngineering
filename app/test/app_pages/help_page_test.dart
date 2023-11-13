import 'package:filter_it/app_pages/help_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('HelpPage - Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(
      home: HelpPage(),
    ));

    expect(find.text('Help Page'), findsOneWidget);

    // Verify that the body contains the help message
    expect(find.text('This will be the help page!'), findsOneWidget);
  });
}
