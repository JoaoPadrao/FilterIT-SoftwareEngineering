import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class LoginPageLogStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    // Assuming the login page is already displayed
  }

  @override
  RegExp get pattern => RegExp(r'I am on the Login Page');
}

class EnterEmailLogStep extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String email) async {
    final emailField = find.byValueKey('emailField_key');
    await FlutterDriverUtils.enterText(world.driver, emailField, email);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  RegExp get pattern => RegExp(r'I enter {string} into the "emailField_key" field');
}

class EnterPasswordLogStep extends And1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String password) async {
    final passwordField = find.byValueKey('passField_key');
    await FlutterDriverUtils.enterText(world.driver, passwordField, password);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  RegExp get pattern => RegExp(r'I enter {string} into the "passField_key" field');
}

class TapLoginBtnLogStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final loginButton = find.byValueKey('signInBtn_key');
    await FlutterDriverUtils.tap(world.driver, loginButton);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  RegExp get pattern => RegExp(r'I tap the "Sign In" button');
}

class VerifyHomePageLogStep extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final homePage = find.byValueKey('homePage');
    final isHomePageDisplayed = await FlutterDriverUtils.isPresent(world.driver, homePage);
    await Future.delayed(const Duration(seconds: 2));
    expect(isHomePageDisplayed, true);

  }


  @override
  RegExp get pattern => RegExp(r'I should be on the Home Page');
}
