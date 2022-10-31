# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# ActiveModel::Serializers allows to generate JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10'

# This module relies on token based authentication. This requires coordination between the client and the server.
gem 'devise_token_auth', '~> 1.2.0'

# Clean ruby syntax for writing and deploying cron jobs
gem 'whenever', '~> 1.0', require: false

# Pagination for clear json view
gem 'pagy', '~> 5.10'

# Maps controller filters to resource scopes
gem 'has_scope', '~> 0.8.0'

group :test do
  # Shoulda Matchers provides RSpec compatible one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 5.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', '~> 2.23.0'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  # Listen gem listens to file modifications and notifies about the changes.
  gem 'listen', '~> 3.3'

  # RuboCop is a Ruby code style checking and code formatting tool.
  gem 'rubocop', '~> 1.18', require: false
  gem 'rubocop-performance', '~> 1.6.1', require: false
  gem 'rubocop-rails', '~> 2.5.2', require: false
  gem 'rubocop-rspec', '~> 2.4.0', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Library for validating urls in Rails
gem 'validate_url', '~> 1.0', '>= 1.0.15'
