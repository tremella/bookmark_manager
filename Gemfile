source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :web_framework do
  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'webrick'
end


group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'pg'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'sinatra-reloader'
end

group :hosting do
  gem 'rack'
  gem 'launchy'
end
