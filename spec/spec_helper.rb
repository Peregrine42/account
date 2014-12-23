ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'rack/test'
require 'byebug'

require_relative '../app'

DatabaseCleaner.strategy = :truncation

ActiveRecord::Base.logger = nil

RSpec.configure do |config|

  config.include Rack::Test::Methods

  config.before(:each) do
    DatabaseCleaner.clean
  end

end

def app
    App
end
