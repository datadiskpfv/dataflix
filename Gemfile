source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

## added bootstrap and awesome font to style the application
gem 'bootstrap-sass', '~> 3.3'
gem 'autoprefixer-rails'

gem 'font-awesome-rails', '~> 4.3'

## allow to create form easier
gem 'simple_form', '~> 3.1.0'

## used to uplaod files
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 4.3'

## used for image carousel
gem 'bxslider-rails'

## used for pagination
gem 'will_paginate', '~> 3.0.7'
gem 'bootstrap-will_paginate', '~> 0.0.10'

## used for charts
gem 'chartkick'

## authenication and authorization
gem 'devise', '~> 3.4.1'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
## had to specify platform as using windows, because of bcrypt_ext error message
gem 'bcrypt', '3.1.11', :platform => :ruby

## used for import excel or csv files
gem 'roo'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  ## add rspec gem
  gem 'rspec-rails', '~> 3.2.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  ## add awesome_print for rails console, also see .irbrc file
  gem 'awesome_print'
end

group :test do
  gem 'capybara', '~> 2.4'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'selenium-webdriver', '~> 2.45'
  gem 'database_cleaner', '~> 1.4'
end