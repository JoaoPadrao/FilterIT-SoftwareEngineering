Feature: Test the Navigation Bar
  Scenario: Switch from Home Page to Help Page
    Given I am on the Home Page
    When I open the drawer
    And I select "Help Page"
    Then I should be on the Help Page