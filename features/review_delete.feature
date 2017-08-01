Feature: Delete a review
  In order delete a review
  As non banned creator or admin
  I want to delete a review for a game

  Scenario: Deleting a review
    Given I am on the review_page
    And I am logged on
    And I am not banned
    Or I am admin
    When I press "Delete review"
    Then I should not see in Review my_name
