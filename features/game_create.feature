Feature: Create a game
  In order create a game
  As a registered, non banned user
  I want to insert a game into the database

  @omniauth_test_success
  Scenario: Creating a game
    Given I am on the homepage
    And I am logged in
    And I am not banned
    And A game named "ABC" doesn't exist
    When I press "Add a new game"
    And I fill in "name" with "ABC"
    And I press "Create Game"
    Then I should see "ABC"
