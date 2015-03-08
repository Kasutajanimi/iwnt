source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '3.2.19'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'capistrano', '~> 3.0', require: false, group: :development

#group :development do
#	gem 'capistrano-rails', '~> 1.1', require: false
#	gem 'capistrano-bundler', '~> 1.1', require: false
#end

#gem 'htmlentities'

# Use Capistrano for deployment
group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end

gem 'locomotive_cms', '~> 2.5.6', :require => 'locomotive/engine'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'compass',        '~> 0.12.7'
  gem 'compass-rails',  '~> 2.0.0'
  gem 'sass-rails',     '~> 3.2.6'
  gem 'coffee-rails',   '~> 3.2.2'
  gem 'uglifier',       '~> 2.5.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
end

gem 'unicorn'

gem 'mime-types'

gem 'puma'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :deveopment do
  gem 'pry'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'ffaker'
end
