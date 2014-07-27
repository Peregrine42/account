Feature: the home page

	Scenario: showing the transaction list
    Given there are transactions in the database
    When  I visit the homepage
		Then I see the transactions
