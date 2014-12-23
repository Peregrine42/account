class Category < ActiveRecord::Base
  has_many :transactions

  default_scope { order('name') }

  def destroy
    if transactions.empty?
      super
    else
      errors.add(:destroy, "The #{name} category could not be deleted as there are still transactions in that category. Please delete those transactions before deleting the category.")
      false
    end
  end
end
