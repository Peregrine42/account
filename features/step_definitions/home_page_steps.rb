Given "there are transactions and categories in the database" do
  Category.create(name: 'Self',        column: 0)
  Category.create(name: 'Council Tax', column: 1)

  Transaction.create(description: 'council tax 1', amount: 5,     category_id: 2, date: "07/05/2014")
  Transaction.create(description: 'self 1',        amount: 10.45, category_id: 1, date: Date.new(2014, 5, 6))
  Transaction.create(description: 'self 2',        amount: 10.55, category_id: 1, date: Date.new(2014, 5, 6))
end

When "I visit the homepage" do
  visit('/')
end

Then "I see the transactions" do
  expect(page.body).to have_content '5.00'
end

Then "I see the total" do
  expect(page.body).to have_content 'Total (£)'
  expect(page.body).to have_content '26.00'
end

Then "I see all the categories" do
  expect(page.body).to have_content 'Self'
  expect(page.body).to have_content 'Council Tax'
end

Then "I see the transactions underneath their category" do
  expect(page).to have_xpath "//table/tr/th[position()=#{4 + (0)} and contains(., 'Council Tax')]"
  expect(page).to have_xpath "//table/tr/th[position()=#{4 + (1)} and contains(., 'Self')]"

  expect(page).to have_xpath "//table/tr/td[position()=#{5 + (0*2)} and contains(., '10.45')]"
  expect(page).to have_xpath "//table/tr/td[position()=#{5 + (1*2)} and contains(., '5.00')]"
end

Then "I see the transactions ordered by date, then by date created" do
  expect(page).to have_xpath "//table/tr[position()=#{2 + 0}]/td[contains(., '10.45')]"
  expect(page).to have_xpath "//table/tr[position()=#{2 + 1}]/td[contains(., '10.55')]"
  expect(page).to have_xpath "//table/tr[position()=#{2 + 2}]/td[contains(., '5.00')]"
end

Then "I see running totals beside the transactions" do
  expect(page).to have_xpath "//table/tr[position()=#{2 + 0}]/td[position()=#{5 + (0*2) + 1} and contains(., '10.45')]"
  expect(page).to have_xpath "//table/tr[position()=#{2 + 1}]/td[position()=#{5 + (0*2) + 1} and contains(., '21.00')]"

  expect(page).to have_xpath "//table/tr[position()=#{2 + 0}]/td[position()=#{3 + (0*2) + 1} and contains(., '10.45')]"
  expect(page).to have_xpath "//table/tr[position()=#{2 + 1}]/td[position()=#{3 + (0*2) + 1} and contains(., '21.00')]"
end
