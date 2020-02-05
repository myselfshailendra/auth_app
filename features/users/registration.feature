Feature: User Registration
  In order to Register User
  A User
  Should be able to register him/herself

  Scenario: User can see a registration form
    Given I will hit signup url
    Then I should see the registration form
    And I should see input fields
    And I should see the signin link on the form

  Scenario: User can do registration with proper details only
    Given I will hit signup url
    Then I should see the registration form
    When I enter submit form with blank details
    Then I should see blank errors
    When I enter submit form with wrong email format
    Then I should see wrong email format errors
    When I enter submit form with less password length
    Then I should see password length errors
    When I enter submit form with invalid password
    Then I should see invalid password errors
    When I enter submit form with mismatched password
    Then I should see mismatched password errors
    When I enter submit form with correct details without accepting term
    Then I should see terms errors
    When I enter submit form with correct details with accepting term
    Then I will be on login page
