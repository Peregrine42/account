When 'click the categories link' do
  click_link 'Category Details'
end

Then 'I see the list of categories' do
  expect(page.body).to have_content('category 1')
  expect(page.body).to have_content('category 2')
end

When 'click the New Category link' do
  click_link 'New Category'
end

When 'fill out the New Category form' do
  fill_in 'category[name]', with: 'groceries'
  click_button 'Create Category'
end

Then 'I see the new category on the homepage' do
  expect(page.body).to have_content 'groceries'
end

When 'click the delete link on category 1' do
  page.all(:link,"Delete")[0].click
end

Then 'category 1 disappears from the list' do
  expect(page.body).to     have_content 'Categories'
  expect(page.body).to_not have_content 'category 1'
end

When 'click the edit link on category 1' do
  page.all(:link,"Edit")[0].click
end

When 'I change the name of the category' do
  fill_in 'category[name]', with: 'a new category'
  click_button 'Done'
end

Then "category 1's name is changed" do
  expect(page.body).to have_content 'Categories'
  expect(page.body).to have_content 'a new category'
end
