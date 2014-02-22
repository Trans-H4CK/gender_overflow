source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

gem 'pg'
gem "haml-rails"
gem "sass-rails"
gem "sass"
gem 'tinymce-rails'
gem 'devise'
gem 'cancan'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'foundation-rails'

group :production, :staging do
  gem 'rails_12factor'
end

group :assets do
  gem 'turbo-sprockets-rails3'
  gem 'nokogiri'
end

group :development, :test do
  gem "rspec", ">= 2.1.0"
  gem "rspec-rails", ">= 2.1.0"
  gem "factory_girl_rails"
  gem 'annotate'
  gem 'simplecov'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'database_cleaner', '~> 1.0.0.RC1'
  gem 'rspec-steps', ">= 0.0.6"
  gem 'byebug'
  gem 'quiet_assets'
  gem 'shoulda'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
