ENV['RACK_ENV'] = 'test'
require 'rspec'

require_relative '../app'

DatabaseCleaner.strategy = :truncation

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.before(:each) do 
    DatabaseCleaner.clean
  end
end
