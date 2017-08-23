Feature: Search for a game
  In order to look for a game
  As a non banned user or visitor
  I want to submit a query for a game

  Scenario: Searching a game
    Given I am not banned
    And A game named "ABC" exists
    And I am on the homepage
    When I fill in "parameter" with "ABC"
    And I press "Search for Game"
    Then I should see "ABC"
