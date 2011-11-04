source :rubygems

source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem "haml-rails"
gem "rest-client"
gem "json"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  # Pretty printed test output
  #gem 'turn', :require => false
  gem "factory_girl_rails"
  gem "factory_girl_generator"
  gem "rspec-rails"
  gem "capybara"
end
