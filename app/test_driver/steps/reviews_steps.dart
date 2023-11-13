import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class SearchPageReviewStep extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final searchPage = find.byValueKey('searchPage');
    final isSearchPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, searchPage);
    expect(isSearchPageDisplayed, true);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  RegExp get pattern => RegExp(r'I am on the Search Page');
}

class TapJobOfferReviewStep extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final jobOffer = find.byValueKey('arrowIcon_0');
    await FlutterDriverUtils.tap(world.driver, jobOffer);
    await Future.delayed(const Duration(seconds: 1));

  }

  @override
  RegExp get pattern => RegExp(r'I tap the first job offer');
}

class ClickSeeReviews extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final jobDetailPage = find.byValueKey('jobDetailPage');

    await world.driver?.scroll(jobDetailPage, 0, -600, const Duration(milliseconds: 500));

    final seeReviewsButton = find.byValueKey('seeMoreReviews_key');
    await FlutterDriverUtils.tap(world.driver, seeReviewsButton);
  }

  @override
  RegExp get pattern => RegExp(r'I tap "See more reviews"');
}

class VerifyReviewsPage extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final reviewsPage = find.byValueKey('reviewPage_key');
    final isReviewsPageDisplayed = await FlutterDriverUtils.isPresent(world.driver, reviewsPage);
    expect(isReviewsPageDisplayed,true);

  }

  @override
  RegExp get pattern => RegExp(r'I see the Review Page on the screen');
}
