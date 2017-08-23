Feature: Edit a review
  In order edit a review
  As non banned creator or admin
  I want to edit a review for a game

  @omniauth_test_success
  Scenario: Editing a review
    Given I am logged in
    And I am not banned
    And I am on the review_page
    And I own the object or I am admin
    When I press "Edit"
    And I fill in "Description" with "review_edited"
    And I press "Save changes"
    And then I press "Read more"
    Then I should read "review_edited"
