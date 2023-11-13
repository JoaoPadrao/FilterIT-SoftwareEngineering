import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class HomePageDetailsStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    // Assuming the home page is already displayed
  }

  @override
  RegExp get pattern => RegExp(r'I am on the Home Page');
}

class SelectSearchPageDetailsStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final searchPageButton = find.byValueKey('search_key');
    await FlutterDriverUtils.tap(world.driver, searchPageButton);

  }

  @override
  RegExp get pattern => RegExp(r'I select "Search Page"');
}

class TapJobOfferDetailsStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    await Future.delayed(const Duration(seconds: 2));
    final jobOffer = find.byValueKey('arrowIcon_2');
    await FlutterDriverUtils.tap(world.driver, jobOffer);

  }

  @override
  RegExp get pattern => RegExp(r'I tap the third job offer');
}

class VerifyJobOfferDetails extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final jobDetailPage = find.byValueKey('jobDetailPage');
    final isJobDetailPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, jobDetailPage);
    expect(isJobDetailPageDisplayed,true);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I see the details of the third job offer');
}
