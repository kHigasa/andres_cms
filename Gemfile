source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use asynchronous processing
gem 'sidekiq'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use slim to write HTML
gem 'slim-rails'
# Pagenation
gem 'kaminari'
# Dump
gem 'oj'
# Upload files
gem 'carrierwave', '~> 1.0'
gem 'rmagick'
# Authentication
gem 'devise'
gem 'omniauth-twitter'
# Authorization
gem 'pundit'
# i18n message
gem 'rails-i18n'
# codebase master data
gem 'active_hash'
# search form
gem 'ransack'
# breadcrumbs
gem 'breadcrumbs_on_rails'
# json serializer
gem 'active_model_serializers'
# I18n
gem 'enum_help'
# erb to slim
gem 'html2slim'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Start local server
  gem 'foreman'
  # Lint
  gem 'rubocop', '~> 0.49.0', require: false
  gem 'rubocop-rspec', '~> 1.10.0', require: false
  # Use git hooks
  gem 'overcommit'
  # To jenkins
  gem 'rubocop-checkstyle_formatter'
  # Debug on browser
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  # Visualize model
  gem 'annotate'
  # Use Capistrano for deployment
  gem 'capistrano-rails', require: false
  # Detect N+1
  gem 'bullet'
end

group :test do
  # Use rspec for test
  gem 'rspec-rails', '~> 3.5.2'
  gem 'shoulda-matchers'
  # Mesure coverage of test
  gem 'simplecov', '~> 0.13.0'
end

group :development, :test do
  # Use pry
  gem 'pry-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'
  # Create factory for test
  gem 'factory_bot_rails'
  # Integration test
  gem 'cucumber-rails', require: false
  # Database cleaning everytime
  gem 'database_cleaner'
  # Create fake data
  gem 'faker'
  # Beautiful log
  gem 'beautiful-log'
  gem 'rails-flog', require: 'flog'
  # E2E test
  gem 'capybara', '~> 2.4.1'
  gem 'selenium-webdriver'
  # ER image
  gem 'rails-erd'
end
