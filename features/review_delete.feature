Feature: Delete a review
  In order delete a review
  As non banned creator or admin
  I want to delete a review for a game

  @omniauth_test_success
  Scenario: Deleting a review
    Given I am logged in
    And I am not banned
    And I am on the test review page
    And I own the object or I am admin
    When I press "Delete review"
    Then I should not see "John Doe"
