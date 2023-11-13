Feature: Login into the app
  Scenario: Successful login
    Given I am on the Login Page
    When I enter "stubuser082@gmail.com" into the "emailField_key" field
    And I enter "123456" into the "passField_key" field
    And I tap the "Sign In" button
    Then I should be on the Home Page
