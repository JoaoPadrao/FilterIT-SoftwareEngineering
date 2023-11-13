Feature: Switching between pages
  Scenario: Switch back to the Home Page
    Given I am on a random Page
    When I open the drawer
    And I select "Home Page"
    Then I should be on the Home Page