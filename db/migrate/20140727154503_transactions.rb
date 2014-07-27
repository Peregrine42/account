class Transactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.text    :description
      t.integer :category_id
    end
  end
end
