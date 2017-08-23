Feature: Create a review
  In order write a review
  As a registered, non banned user
  I want to add a review for a game

  Scenario: Reviewing a game
    Given I am logged on
    And I am not banned
    And I am on the game_page
    When I press "Add review"
    And I fill in "Description" with "Very good game"
    And I press "Create Review"
    Then I should see my_name in Review
