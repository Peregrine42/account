require 'rubygems'
require 'bundler'
Bundler.require(:default)

class App < Sinatra::Base
  Dir["./app/**/*.rb"].each {|file| require file }
end
