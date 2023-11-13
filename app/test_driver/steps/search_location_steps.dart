import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class HomePageSearchStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    // Assuming the home page is already displayed
  }

  @override
  RegExp get pattern => RegExp(r'I am on the Home Page');
}

class SearchForJob extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final dropDownButton = find.byValueKey('locationDropdown');
    await FlutterDriverUtils.tap(world.driver, dropDownButton);

    final optionAveiro = find.text('Aveiro');
    await FlutterDriverUtils.tap(world.driver, optionAveiro);

    final searchButton = find.byValueKey('searchButton');
    await FlutterDriverUtils.tap(world.driver, searchButton);
  }

  @override
  RegExp get pattern => RegExp(r'I search for a job in "Aveiro"');
}

class VerifyJobsSearchStep extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    await Future.delayed(const Duration(seconds: 5));
    final jobsInAveiro = find.byValueKey('snackBarText');
    final isDisplayedJobsAveiro = await FlutterDriverUtils.isPresent(world.driver, jobsInAveiro);
    expect(isDisplayedJobsAveiro, true);

  }
  @override
  RegExp get pattern => RegExp(r'I should see the jobs in Aveiro');
}