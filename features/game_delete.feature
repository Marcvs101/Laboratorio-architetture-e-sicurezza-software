Feature: Delete a game
  In order delete a game
  As a non banned creator or admin
  I want to delete a game into the database

  @omniauth_test_success
  Scenario: Deleting a game
    Given I am logged in
    And I am not banned
    And I am on the game_page
    And I own the object or I am admin
    When I press "Delete"
    And I press "Ok"
    Then I should not see game
