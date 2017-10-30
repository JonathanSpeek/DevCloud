source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Makes forms easier to create
gem 'simple_form'

# Basic authentication setup
gem 'devise'
gem 'devise_invitable', '~> 1.7.0'

# Adds the Materialize CSS library
gem 'materialize-sass'

# Adds haml support
gem 'haml-rails'

# Adds OmniAuth
gem 'omniauth'
gem 'omniauth-google-oauth2', '~> 0.2.1'
gem 'omniauth-github'

# Handles file uploads and storage
gem 'carrierwave'
gem 'fog-aws'
gem 'figaro'

# Processing payments
gem 'stripe'

# Library for charts
gem 'chartkick'

# Handles an admin dashboard
gem 'administrate', '~> 0.3.0'

gem 'bourbon'

# Adds the Font Awesome library
gem 'font-awesome-sass'

# Handles syntax highlighting
gem 'redcarpet'
gem 'coderay'

# Handles soft deletes
gem 'paranoia'

gem 'mail_form'

# Handles permissions
gem 'cancancan'

# Handles pagination
gem 'will_paginate'
gem 'will_paginate-materialize'

# Handles markdown preview
gem 'simplemde-rails'

# Adds emoji support
gem 'gemoji'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
  gem 'foreman'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  # Replace the rails console with Pry, which is easier to use
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-byebug'
  gem 'rubocop'
  gem 'awesome_print'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
