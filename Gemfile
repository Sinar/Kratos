source 'http://rubygems.org'

gem 'rake'

gem 'rails', '3.1.1'

gem 'cancan'
gem 'devise'

gem 'composite_primary_keys'
gem 'enumerated_attribute'
gem 'pg'
gem 'uuidtools'
gem 'validatious'
gem 'yaml_db'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'simple_form'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem 'linecache19'
  gem 'ruby-debug-base19'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'ruby-debug-ide'
  gem 'sqlite3'
end

# RSpec must be added into the development group, else, specs won't run.
# See: http://yehudakatz.com/2010/05/09/the-how-and-why-of-bundler-groups/
group :development, :test do
  gem 'rspec-rails'
end

group :test do
  # Cucumber dependencies
  # gem 'cucumber-rails'
  # gem 'cucumber-api-steps'
  gem 'rack-test', :require => 'rack/test'
  gem 'json_spec'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda'
end
