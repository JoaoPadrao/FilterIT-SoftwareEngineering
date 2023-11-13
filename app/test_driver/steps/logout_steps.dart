import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class RandomPageLogout extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    // Assuming the random Page is already displayed
  }

  @override
  RegExp get pattern => RegExp(r'I am on a random Page');
}

class ClickSignOut extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final signOutButton = find.byValueKey('logout_key');
    await FlutterDriverUtils.tap(world.driver, signOutButton);
  }

  @override
  RegExp get pattern => RegExp(r'I select "Sign Out"');
}

class VerifyLoginPage extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final loginPage = find.byValueKey('loginPage_key');
    final isLoginPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, loginPage);
    expect(isLoginPageDisplayed,true);

  }

  @override
  RegExp get pattern => RegExp(r'I should be on the Login Page');
}
