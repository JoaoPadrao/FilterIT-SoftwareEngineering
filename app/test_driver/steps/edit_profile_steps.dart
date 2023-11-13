import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'dart:math';

final random = Random();
final firstNames = ['John', 'Alice', 'Michael', 'Emily', 'David'];
final lastNames = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones'];
final randomFirstName = firstNames[random.nextInt(firstNames.length)];
final randomLastName = lastNames[random.nextInt(lastNames.length)];
final randomFullName = '$randomFirstName $randomLastName';

class HomePageEditStep extends GivenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async {
    // Assuming the random Page is already displayed
  }

  @override
  RegExp get pattern => RegExp(r'I am on a random Page');
}

class SelectProfileEditStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final profileButton = find.byValueKey('profile_key');
    await FlutterDriverUtils.tap(world.driver, profileButton);
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  RegExp get pattern => RegExp(r'I select "Profile"');
}

class TapEditProfile extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {

    final editProfileButton = find.byValueKey('edit_profile_key');
    await FlutterDriverUtils.tap(world.driver, editProfileButton);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the "Edit Profile" button');
}



class EnterNameEditStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final fullNameField = find.byValueKey('name_key');

    await FlutterDriverUtils.enterText(world.driver!, fullNameField, randomFullName);
  }

  @override
  RegExp get pattern => RegExp(r'I enter my name in the Full Name field');
}



class SaveProfileEditStep extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    await Future.delayed(const Duration(seconds: 2));

    final editPage = find.byValueKey('edit_profile_page_key');

    await world.driver?.scroll(editPage, 0, -600, const Duration(milliseconds: 500));


    FlutterDriverUtils.waitForFlutter(world.driver);
    final saveButtonKey = find.byValueKey('Save_button_key');
    await FlutterDriverUtils.tap(world.driver, saveButtonKey);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the "Save" button');
}


class CheckNameEditStep extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final fullNameFieldKey = find.byValueKey('profile_name_key');
    final fullName = await FlutterDriverUtils.getText(world.driver!, fullNameFieldKey);
    expect(fullName, randomFullName);
  }

  @override
  RegExp get pattern => RegExp(r'I should see my name in the "Full Name" field');
}
