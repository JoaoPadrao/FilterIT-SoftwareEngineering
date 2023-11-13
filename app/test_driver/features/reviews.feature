Feature: See the reviews about a job offer
  Scenario: See the reviews about the first job offer.
    Given I am on the Search Page
    When I tap the first job offer
    And I tap "See more reviews"
    Then I see the Review Page on the screen