import 'package:filter_it/authentication/forgot_password_page.dart';
import 'package:filter_it/authentication/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



void main() {

  late LoginPage loginPage;

  setUp(() {
    loginPage = LoginPage(
      showRegisterPage: () {},
    );
  });

  testWidgets('LoginPage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: loginPage,
        routes: {
          '/forgot_password': (_) => ForgotPasswordPage(),
        },
      ),
    );

    expect(find.text('Welcome to FilterIT'), findsOneWidget);
    expect(find.byKey(const Key('emailfield')), findsOneWidget);
    expect(find.byKey(const Key('passfield')), findsOneWidget);
    expect(find.byType(GestureDetector), findsWidgets);

    // Simulate entering email and password
    await tester.enterText(find.byKey(const Key('emailfield')), 'stubuser082@gmail.com');
    await tester.enterText(find.byKey(const Key('passfield')), '123456');



  });
}
