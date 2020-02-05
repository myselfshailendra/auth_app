Feature: Sign In User
  In order to login and logout of the system
  A user
  Should be able to sign in and sign out

  Scenario: User should be able to login
    Given I seeded up data
    And I am on the login page
    When I sign in with blank credentials
    Then I should see the invalid credentials error
    When I sign in with incorrect email
    Then I should see the invalid credentials error
    When I sign in with incorrect password
    Then I should see the invalid credentials error
    When I sign in with correct credentials
    Then I should see the dashboard page
    When I click on logout
    Then I am on the login page