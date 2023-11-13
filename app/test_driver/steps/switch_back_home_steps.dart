import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class RandomPage extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  RegExp get pattern => RegExp(r'I am on a random Page');
}

class SelectHomePage extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final searchPageButton = find.byValueKey('home_key');
    await FlutterDriverUtils.tap(world.driver, searchPageButton);
  }

  @override
  RegExp get pattern => RegExp(r'I select "Home Page"');
}

class VerifyHomePage extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final searchPage = find.byValueKey('homePage');
    final isSearchPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, searchPage);
    await Future.delayed(const Duration(seconds: 1));
    expect(isSearchPageDisplayed, true);
  }

  @override
  RegExp get pattern => RegExp(r'I should be on the Home Page');
}
