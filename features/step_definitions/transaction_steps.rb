Given "there is a transaction and a category in the database" do
  category = Category.create!(name: 'the category', column: 0)
  category.transactions.create!(description: 'a transaction', amount: '4', date: Date.new(2014, 4, 4))
end

Given "there are some categories in the database" do
  Category.create!(name: 'category 1', column: 0)
  Category.create!(name: 'category 2', column: 1)
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


When "I click the New link on the homepage" do
  visit '/'
  click_link 'New Transaction'
end

When "I enter the transaction details" do
  fill_in('Description', with: 'transaction details')
  fill_in('Amount', with: '5.67')
  fill_in('Date', with: '4/5/2006')
  select('category 2', from: 'Category')
end

When "I click the Create link" do
  click_link 'Create Transaction'
end

Then "the transaction appears on the homepage" do

end
