Feature: Edit a review
  In order edit a review
  As non banned creator or admin
  I want to edit a review for a game

  Scenario: Editing a game
    Given I am on the review_page
    And I am logged on
    And I am not banned
    Or I am admin
    When I press "Edit"
    And I fill in "Description" with "review_edited"
    And I press "Save changes" 
    And then I press "Read more"
    Then I should read "review_edited"
