require 'rubygems'
require 'bundler'
require 'will_paginate'
require 'will_paginate/active_record'
require 'will_paginate/view_helpers/sinatra'
Bundler.require(:default)

class App < Sinatra::Base
  Dir["./app/**/*.rb"].each {|file| require file }

  helpers WillPaginate::Sinatra::Helpers
  set :views, Proc.new { File.join(root, "./app/views") }
end
