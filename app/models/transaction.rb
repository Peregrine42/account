class Transaction < ActiveRecord::Base
  belongs_to :category
  scope :table_order, -> { order(date: :asc, created_at: :asc) }

  validates :description, presence: true
  validates :amount,      numericality: true, presence: true
  validates :category,    presence: true
  validates :date,        presence: true

  def amount_as_string
    as_money(amount)
  end

  def amount_as_decimal
    as_decimal amount
  end

  def running_total_as_string
    as_money(running_total)
  end

  def running_total_for_category
    previous_transactions(category.transactions).inject(0) { |sum, t| sum + t.amount }
  end

  def running_total_for_category_as_string
    as_money(running_total_for_category)
  end

  def columns_from_left
    category.column * 2
  end

  def running_total
    previous_transactions(Transaction.all).inject(0) { |sum, t| sum + t.amount }
  end

  def previous_transactions transactions
    sorted_transactions = transactions.table_order
    index = sorted_transactions.find_index(self)
    sorted_transactions.slice(0..index)
  end

  def as_money value
    return "" if value.nil?
    (value > 0 ? "+" : "") + as_decimal(value)
  end

  def as_decimal value
    "%.02f" % value
  end
end
