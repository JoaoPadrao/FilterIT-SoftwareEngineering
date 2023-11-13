import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class HomePageSwitchStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    // Assuming the home page is already displayed
  }

  @override
  RegExp get pattern => RegExp(r'I am on the Home Page');
}

class SelectSearchPageSwitchStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final searchPageButton = find.byValueKey('help_key');
    await FlutterDriverUtils.tap(world.driver, searchPageButton);
  }

  @override
  RegExp get pattern => RegExp(r'I select "Help Page"');
}

class VerifySearchPage extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final searchPage = find.byValueKey('helpPage');
    final isSearchPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, searchPage);
    await Future.delayed(const Duration(seconds: 1));
    expect(isSearchPageDisplayed, true);
  }

  @override
  RegExp get pattern => RegExp(r'I should be on the Help Page');
}
