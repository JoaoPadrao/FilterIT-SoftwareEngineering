import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'dart:math';
final random = Random();
final username = 'user${random.nextInt(10000)}';
final randomEmail = '$username@example.com';

class LoginPageRegStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    // Assuming the login page is already displayed
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  RegExp get pattern => RegExp(r'I am on the Login Page');
}

class TapRegisterNowRegStep extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final registerNowButton = find.byValueKey('registerBtn_key');
    await FlutterDriverUtils.tap(world.driver, registerNowButton);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I tap "Register Now"');
}

class EmailRegStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final email = randomEmail;
    final emailField = find.byValueKey('emailRegister_key');
    await FlutterDriverUtils.enterText(world.driver, emailField, email);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I enter my email');
}

class PasswordRegStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    const password = 'password123';
    final passwordField = find.byValueKey('passwordRegister_key');
    await FlutterDriverUtils.enterText(world.driver, passwordField, password);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I enter my password');
}

class ConfirmPassRegStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    const password = 'password123';
    final confirmPasswordField = find.byValueKey('confirmPassReg_key');
    await FlutterDriverUtils.enterText(world.driver, confirmPasswordField, password);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I fill the "confirmPassReg_key" field with my password');
}

class TapSignUpBtnRegStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final signUpButton = find.byValueKey('signUpBtn_key');
    await FlutterDriverUtils.tap(world.driver, signUpButton);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I tap the "Sign Up" button');
}


class VerifyEmailAccRegStep extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    await Future.delayed(const Duration(seconds: 2));
    final verifyEmailPage = find.byValueKey('verifyEmailPage');
    final isVerifyEmailPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, verifyEmailPage);
    expect(isVerifyEmailPageDisplayed, true);
    final cancelBtn = find.byValueKey('cancel_key');
    await FlutterDriverUtils.tap(world.driver, cancelBtn);

  }

  @override
  RegExp get pattern => RegExp(r'I need to verify my email account');
}