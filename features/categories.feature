Feature: CRUD categories

  Scenario: showing all the categories
    Given there are some categories in the database
    When  I visit the homepage
    And   click the categories link
    Then  I see the list of categories

  Scenario: creating a new category
    When I visit the homepage
    And  click the categories link
    And  click the New Category link
    And  fill out the New Category form
    Then I see the new category on the homepage
