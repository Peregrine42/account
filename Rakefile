ENV['RACK_ENV'] ||= 'test'
require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'sinatra/activerecord/rake'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format pretty'
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c",
	                "-f progress",
	                "-r ./spec/spec_helper.rb"]
end

task :default => [:spec, :features]
