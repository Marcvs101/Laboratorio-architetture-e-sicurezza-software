Feature: Modify a game
  In order modify a game
  As a non banned creator or admin
  I want to modify a game into the database

  @omniauth_test_success
  Scenario: Modifying a game
    Given I am logged in
    And I am not banned
    And I am on the test game page
    And I own the object or I am admin
    When I press "Edit"
    And I fill in "name" with "ABC_edited" in form "game"
    And I fill in "genre" with "Genre_Edited" in form "game"
    And I click "Save changes"
    Then I should see "ABC_edited"
