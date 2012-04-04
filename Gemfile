source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'heroku'

# Security/auth/roles
gem 'devise'
gem 'cancan'
gem 'rolify'

# Views
gem 'haml'
gem 'formtastic'
gem 'kaminari'
gem 'rabl', '>= 0.5.4' #JSON views
gem 'RedCloth'

#Email
gem 'actionmailer-with-request'

#Backend
gem 'pg'
gem 'squeel'
gem 'state_machine'
gem 'ancestry'        #Tree structure for dealers
gem 'grouped_validations'
gem 'validates_timeliness'
gem 'pg_search'
gem 'valium'

#controllers
gem 'inherited_resources'
gem 'responders'
gem 'delocalize' #Handle dates in m/d/Y format


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'bourbon' #SASS mixins
  gem 'rails-backbone'
  gem 'twitter-bootstrap-rails'
  gem 'less', "=2.0.11" # Assets weren't compiling correctly
end

gem 'jquery-rails'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'timecop'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'railroady' #Diagrams of models
  gem 'ruby-graphviz'

  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
