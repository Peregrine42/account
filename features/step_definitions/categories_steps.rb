When 'click the categories link' do
  click_link 'Categories'
end

Then 'I see the list of categories' do
  expect(page.body).to have_content('category 1')
  expect(page.body).to have_content('category 2')
end

When 'click the New Category link' do
  click_link 'New Category'
end

When 'fill out the New Category form' do
  fill_in 'Name', with: 'groceries'

end

Then 'I see the new category on the homepage' do
  expect(page.body).to have_content 'groceries'
end


