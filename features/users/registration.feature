Feature: User Registration
  In order to Register User
  A User
  Should be able to register him/herself

  Scenario: User can see a registration form
    Given I will hit signup url
    Then I should see the registration form
    And I should see input fields
    And I should see the signin link on the form
