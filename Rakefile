require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format pretty'
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c", 
  	              "-f progress", 
  	              "-r ./spec/spec_helper.rb"]
end

task :default => [:spec, :features]