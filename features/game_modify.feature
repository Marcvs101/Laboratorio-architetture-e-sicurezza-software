Feature: Modify a game
  In order modify a game
  As a non banned creator or admin 
  I want to modify a game into the database

  Scenario: Modifying a game
    Given I am on the game_page
    And I am creator
    And I am not banned
    Or I am admin
    When I press "Edit"
    And I fill in "name" with "ABC_edited"
    And I fill in "genre" with "Sport"
    And I fill in "year" with "2012"
    And I press "Save changes"
    Then I should see "ABC_edited"
