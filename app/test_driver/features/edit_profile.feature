Feature:Edit profile
  Scenario: Edit Full Name of a user
  Given I am on a random Page
  When I open the drawer
  And I select "Profile"
  And I tap the "Edit Profile" button
  And I enter my name in the Full Name field
  And I tap the "Save" button
  Then I should see my name in the "Full Name" field