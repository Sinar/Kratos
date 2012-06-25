source 'http://rubygems.org'

gem 'rake'

gem 'rails', '3.1.1'

gem 'cancan'
gem 'devise'
gem 'devise-encryptable'

gem 'composite_primary_keys'
gem 'enumerated_attribute'
gem 'nilify_blanks'
gem 'pg'
gem 'simple_form'
gem 'uuidtools'
gem 'validatious'
gem 'yaml_db'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  # Too many mysteries behind, use 'debugger' instead.
  # See: http://stackoverflow.com/a/10024840/36397
  gem 'debugger'
  # gem 'linecache19'
  # gem 'ruby-debug-base19'
  # gem 'ruby-debug19', :require => 'ruby-debug'
  # I reckon the developer should gem install this manually.
  # gem 'ruby-debug-ide'
  # Heroku
  # See: https://devcenter.heroku.com/articles/taps
  gem 'taps'
end

# RSpec must be added into the development group, else, specs won't run.
# See: http://yehudakatz.com/2010/05/09/the-how-and-why-of-bundler-groups/
group :development, :test do
  gem 'rspec-rails'
end

group :test do
  # Test is run locally, not on Heroku except CI 
  # See: http://stackoverflow.com/q/5035828/36397
  gem 'sqlite3'
  # Cucumber dependencies
  # gem 'cucumber-rails'
  # gem 'cucumber-api-steps'
  gem 'rack-test', :require => 'rack/test'
  gem 'json_spec'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda'
end
