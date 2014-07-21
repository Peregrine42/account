ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

require_relative '../../app'

Capybara.app = App

class AppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  AppWorld.new
end