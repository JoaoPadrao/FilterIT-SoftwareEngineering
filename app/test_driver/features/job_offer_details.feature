Feature: See the details of a job offer
  Scenario: See the details of the third job offer
    Given I am on the Home Page
    When I open the drawer
    And I select "Search Page"
    And I tap the third job offer
    Then I see the details of the third job offer
