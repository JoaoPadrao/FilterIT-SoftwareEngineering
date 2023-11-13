Feature:  Register in an account
  Scenario: Register in an account with valid data
    Given I am on the Login Page
    When I tap "Register Now"
    And I enter my email
    And I enter my password
    And I fill the "confirmPassReg_key" field with my password
    And I tap the "Sign Up" button
    Then I need to verify my email account