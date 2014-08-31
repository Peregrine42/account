Feature: the home page

	Scenario: show the transaction list
    Given there are transactions and categories in the database
    When  I visit the homepage
		Then I see the transactions

  Scenario: show the balance
    Given there are transactions and categories in the database
    When  I visit the homepage
    Then  I see the total

  Scenario: show the categories
    Given there are transactions and categories in the database
    When  I visit the homepage
    Then  I see all the categories

  Scenario: show each transaction amount under its category
    Given there are transactions and categories in the database
    When  I visit the homepage
    Then  I see the transactions underneath their category

  Scenario: order the transactions by date, then by date created
    Given there are transactions and categories in the database
    When  I visit the homepage
    Then  I see the transactions ordered by date, then by date created

  @wip
  Scenario: show running totals
    Given there are transactions and categories in the database
    When  I visit the homepage
    Then  I see running totals beside the transactions
