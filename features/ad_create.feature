Feature: Create an ad
  In order to create an ad
  As a registered, non banned user
  I want to add an ad to a game

  Scenario: Creating an ad
    Given I am on the game_page
    And I am logged on
    And I am not banned
    When I press "Add ad"
    And I fill in "location" with "Capital City"
    And I fill in "description" with "description_of_ad"
    And I fill in "delivery" with "delivery_mode"
    And I press "Create Ad"
    Then I should see in Ads user
