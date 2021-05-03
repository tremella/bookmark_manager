ENV["ENVIRONMENT"] = 'test'
require 'sinatra'
require 'sinatra/reloader'
require 'capybara'
require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'



# ENV["RACK_ENV"] = 'test'

# this sets the test environment


RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end


Capybara.app = BM

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
