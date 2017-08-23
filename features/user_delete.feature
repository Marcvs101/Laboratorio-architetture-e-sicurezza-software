Feature: Delete an user
  In order delete an user
  As an admin
  I want to remove an user from the database

  Scenario: Deleting an user
    Given "user" exists
    And I am admin
    And I am on the user_page
    When I press "Destroy user"
    Then I should not see "user" in Users
