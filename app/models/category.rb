class Category < ActiveRecord::Base
  has_many :transactions

  default_scope { order('name') }
end
