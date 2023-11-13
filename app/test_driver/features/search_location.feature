Feature: Search jobs for a specific location
  Scenario: Search jobs in Aveiro
    Given I am on the Home Page
    When I search for a job in "Aveiro"
    Then I should see the jobs in Aveiro