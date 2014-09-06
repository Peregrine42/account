Feature: transactions

  Scenario: showing a transaction
    Given there is a transaction and a category in the database
    When  I click the transaction description on the homepage
    Then  I see the transaction details
