source 'https://rubygems.org'

ruby '2.1.4'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# Use Thin for our web server
gem 'thin'

gem 'activesupport'
gem 'activerecord'

gem 'rake'

gem 'shotgun'

gem 'httparty'

gem 'jasmine', github: 'pivotal/jasmine-gem', ref: 'e810540'
gem 'jasmine-core', '1.3.1'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
end
