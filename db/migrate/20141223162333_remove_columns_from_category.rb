class RemoveColumnsFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :column
  end
end
