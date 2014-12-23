Feature: CRUD categories

  Scenario: showing all the categories
    Given there are some categories in the database
    When  I visit the homepage
    And   click the categories link
    Then  I see the list of categories
