Feature: Delete a game
  In order delete a game
  As a non banned creator or admin 
  I want to delete a game into the database

  Scenario: Deleting a game
    Given I am on the game_page
    And I am creator
    And I am not banned
    Or I am admin
    When I press "Delete"
    And I press "Ok"
    Then I should not see game
