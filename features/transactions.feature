Feature: transactions

  Scenario: showing a transaction
    Given there is a transaction and a category in the database
    When  I click the transaction description on the homepage
    Then  I see the transaction details

  @wip
  Scenario: adding a new transaction
    Given there are some categories in the database
    When  I click the New link on the homepage
    And   I enter the transaction details
    And   I click the Create link
    Then  the transaction appears on the homepage
