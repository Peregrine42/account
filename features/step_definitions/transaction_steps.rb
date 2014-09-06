Given "there is a transaction and a category in the database" do
  category = Category.create!(name: 'the category', column: 0)
  category.transactions.create!(description: 'a transaction', amount: '4', date: Date.new(2014, 4, 4))
end

When "I click the transaction description on the homepage" do
  visit '/'
  click_link 'a transaction'
end

Then "I see the transaction details" do
  expect(page).to have_content 'the category'
  expect(page).to have_content '+4.00'
  expect(page).to have_content 'Friday 4th April 2014'
end
