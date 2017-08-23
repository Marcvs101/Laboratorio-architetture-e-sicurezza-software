Feature: Delete an ad
  In order to delete an ad
  As a non banned creator or admin
  I want to delete an ad from a game

  Scenario: Deleting an ad
    Given I am logged in
    And I am not banned
    And I am on the ad_page
    And I own the object or I am admin
    When I press "Delete"
    And I press "Ok"
    Then I should not see "user" in Ads
