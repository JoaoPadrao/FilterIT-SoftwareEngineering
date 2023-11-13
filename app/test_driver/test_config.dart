import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/edit_profile_steps.dart';
import 'steps/job_offer_details_steps.dart';
import 'steps/login_steps.dart';
import 'steps/logout_steps.dart';
import 'steps/register_steps.dart';
import 'steps/reviews_steps.dart';
import 'steps/search_location_steps.dart';
import 'steps/switch_back_home_steps.dart';
import 'steps/switch_pages_steps.dart';
import 'steps/tap_back_button_steps.dart';

Future<void> main() async {
  final config = FlutterTestConfiguration()
    ..features = [
      // Register feature
      Glob(r"test_driver/features/register.feature"),

      // Login feature
      Glob(r"test_driver/features/login.feature"),

      // Search job of a location ("Aveiro")
      Glob(r"test_driver/features/search_location.feature"),

      // Switch pages (Home -> Search)
      Glob(r"test_driver/features/switch_page.feature"),

      //Switch back to home page (Random page -> Home)
      Glob(r"test_driver/features/switch_back_home.feature"),

      //See job offer details
      Glob(r"test_driver/features/job_offer_details.feature"),

      //Tap the back button
      Glob(r"test_driver/features/tap_back_button.feature"),

      //See reviews
      Glob(r"test_driver/features/reviews.feature"),

      //Tap the back button 2 times
      Glob(r"test_driver/features/tap_back_button.feature"),
      Glob(r"test_driver/features/tap_back_button.feature"),

      //Edit profile
      Glob(r"test_driver/features/edit_profile.feature"),

      //logout
      Glob(r"test_driver/features/logout.feature"),


    ]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..order = ExecutionOrder.sequential

    ..stepDefinitions = [
      // Register steps
      LoginPageRegStep(),
      TapRegisterNowRegStep(),
      EmailRegStep(),
      PasswordRegStep(),
      ConfirmPassRegStep(),
      TapSignUpBtnRegStep(),
      VerifyEmailAccRegStep(),


      // Login steps
      LoginPageLogStep(),
      EnterEmailLogStep(),
      EnterPasswordLogStep(),
      TapLoginBtnLogStep(),
      VerifyHomePageLogStep(),


      // Search job of a location
      HomePageSearchStep(),
      SearchForJob(),
      VerifyJobsSearchStep(),


      // Switch pages
      HomePageSwitchStep(),
      SelectSearchPageSwitchStep(),
      VerifySearchPage(),


      //Switch back to home page
      RandomPage(),
      SelectHomePage(),
      VerifyHomePage(),


      //See job offer details
      HomePageDetailsStep(),
      SelectSearchPageDetailsStep(),
      TapJobOfferDetailsStep(),
      VerifyJobOfferDetails(),


      //Tap the back button
      RandomPageStep(),
      PreviousPageStep(),


      //Reviews
      SearchPageReviewStep(),
      TapJobOfferReviewStep(),
      ClickSeeReviews(),
      VerifyReviewsPage(),


      //Edit profile
      HomePageEditStep(),
      SelectProfileEditStep(),
      TapEditProfile(),
      EnterNameEditStep(),
      SaveProfileEditStep(),
      CheckNameEditStep(),


      //Logout
      RandomPageLogout(),
      ClickSignOut(),
      VerifyLoginPage(),

    ]


    ..restartAppBetweenScenarios = false
    ..targetAppPath = "test_driver/app.dart";
  final runner = GherkinRunner();
  await runner.execute(config);
}
