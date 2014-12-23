Given "there is a transaction and a category in the database" do
  category = Category.create!(name: 'the category')
  category.transactions.create!(description: 'a transaction', amount: '4', date: Date.new(2014, 4, 4))
end

Given "there are some categories in the database" do
  Category.create!(name: 'category 1')
  Category.create!(name: 'category 2')
end

When "I click the transaction description on the homepage" do
  visit '/'
  click_link 'a transaction'
end

When "I click the delete link for the transaction" do
  click_button 'delete'
end

Then "the transaction is no longer in the database" do
  expect(Transaction.find_by(description: 'a transaction')).to be_nil
end

When "I click the New link on the homepage" do
  visit '/'
  click_link 'New Transaction'
end

When "I enter the transaction details" do
  fill_in('transaction[description]', with: 'transaction details')
  fill_in('transaction[amount]', with: '5.67')
  fill_in('transaction[date]', with: '4/5/2006')
  choose('category 2')
end

When "I click the Create link" do
  click_button 'Create Transaction'
end

Then "I see the transaction details" do
  expect(page).to have_content 'the category'
  expect(page).to have_content '+4.00'
  expect(page).to have_content 'Friday 4th April 2014'
end

Then "the transaction appears on the homepage" do
  expect(page).to have_content 'transaction details'
  expect(page).to have_xpath "//table/tr/td[position()=#{5 + (1*2)} and contains(., '5.67')]"
  expect(page).to have_content '04/05/2006'
end

When "I click the edit link for the transaction" do
  click_link 'edit'
end

When "I change some details" do
  fill_in('transaction[description]', with: 'edited transaction')
  fill_in('transaction[amount]', with: '100.78')
  fill_in('transaction[date]', with: '4/5/2007')
end

When "I click the Save link" do
  click_button 'Save'
end

Then "the updated transaction appears on the homepage" do
  expect(page).to have_content 'edited transaction'
  expect(page).to have_xpath "//table/tr/td[position()=#{5 + (1*1)} and contains(., '100.78')]"
  expect(page).to have_content '04/05/2007'
end
