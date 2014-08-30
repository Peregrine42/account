Given "there are transactions in the database" do
  Transaction.create(amount: 5, category_id: 1, date: Date.new(2014, 5, 5))
end

When "I visit the homepage" do

end

Then "I see the transactions" do

end
