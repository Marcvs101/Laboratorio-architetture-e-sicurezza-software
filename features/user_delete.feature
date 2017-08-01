Feature: Delete an user
  In order delete an user
  As an admin 
  I want to remove an user from the database

  Scenario: Deleting an user
    Given I am on the user_page
    And I am admin
    When I press "Destroy user"
    Then I should not see in user_page user
