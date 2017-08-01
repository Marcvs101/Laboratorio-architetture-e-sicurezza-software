Feature: Delete an ad
  In order to delete an ad
  As a non banned creator or admin 
  I want to delete an ad from a game

  Scenario: Deleting an ad
    Given I am on the ad_page
    And I am creator
    And I am not banned
    Or I am admin
    When I press "Delete"
    And I press "Ok"
    Then I should not see in Ads user
