Feature: transactions

  Scenario: showing a transaction
    Given there is a transaction and a category in the database
    When  I click the transaction description on the homepage
    Then  I see the transaction details

  Scenario: adding a new transaction
    Given there are some categories in the database
    When  I click the New link on the homepage
    And   I enter the transaction details
    And   I click the Create link
    Then  the transaction appears on the homepage

  @wip
  Scenario: editing a transaction
    Given there is a transaction and a category in the database
    When  I click the transaction description on the homepage
    And   I click the edit link for the transaction
    And   I change some details
    And   I click the Save link
    Then  the updated transaction appears on the homepage
