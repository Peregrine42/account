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

  Scenario: deleting a category
    Given there are some categories in the database
    When  I visit the homepage
    And   click the categories link
    And   click the delete link on category 1
    Then  category 1 disappears from the list

  @wip
  Scenario: edit a category
    Given there are some categories in the database
    When  I visit the homepage
    And   click the categories link
    And   click the edit link on category 1
    And   I change the name of the category
    Then  category 1's name is changed
