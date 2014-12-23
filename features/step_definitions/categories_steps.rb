When 'click the categories link' do
  click_link 'Categories'
end

Then 'I see the list of categories' do
  expect(page.body).to have_content('category 1')
  expect(page.body).to have_content('category 2')
end
