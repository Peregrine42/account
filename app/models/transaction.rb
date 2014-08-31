class Transaction < ActiveRecord::Base
  belongs_to :category
  scope :table_order, -> { order(date: :asc, created_at: :asc) }

  def running_total
    previous_transactions(category.transactions).inject(0) { |sum, t| sum + t.amount }
  end

  def previous_transactions transactions
    sorted_transactions = transactions.table_order
    index = sorted_transactions.find_index(self)
    sorted_transactions.slice(0..index)
  end
end
