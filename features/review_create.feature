Feature: Create a review
  In order write a review
  As a registered, non banned user
  I want to add a review for a game

  Scenario: Reviewing a game
    Given I am on the game_page
    And I am logged on
    And I am not banned
    When I press "Add review"
    And I fill in "Description" with "Very good game"
    And I press "Create Review"
    Then I should see in Review my_name
