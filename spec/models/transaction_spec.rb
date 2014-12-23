require 'spec_helper'

describe Transaction, '#running_total_for_category' do
  it 'counts a transaction for a previous day that were created after the current transaction' do
    Category.create!(id: 1, name: 'foo')
    current_transaction  = Transaction.create!(category_id: 1, amount: 1, date: Date.new(2014, 8, 31), created_at: DateTime.new(2014, 8, 31, 8, 0, 0), description: 'blah')
    Transaction.create!(category_id: 1, amount: 1, date: Date.new(2014, 7, 21), created_at: DateTime.new(2014, 8, 31, 9, 0, 0), description: 'blah')

    expect(current_transaction.running_total_for_category).to eq 2.0
  end
end

describe Transaction, '#amount_as_string' do

  it 'gives money as a string' do
    current_transaction  = Transaction.new(category_id: 1, amount: 1, date: Date.new(2014, 8, 31), created_at: DateTime.new(2014, 8, 31, 8, 0, 0), description: 'blah')
    expect(current_transaction.amount_as_string).to eq '+1.00'
  end

end
