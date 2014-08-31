require 'spec_helper'

describe Transaction, '#running_total' do
  it 'counts a transaction for a previous day that were created after the current transaction' do
    Category.create!(id: 1)
    current_transaction  = Transaction.create!(category_id: 1, amount: 1, date: Date.new(2014, 8, 31), created_at: DateTime.new(2014, 8, 31, 8, 0, 0))
    Transaction.create!(category_id: 1, amount: 1, date: Date.new(2014, 7, 21), created_at: DateTime.new(2014, 8, 31, 9, 0, 0))

    expect(current_transaction.running_total).to eq 2.0
  end

end
