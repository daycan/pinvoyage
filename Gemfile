source 'https://rubygems.org'

# Manages authentication for user etc
gem 'devise'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Search gems
gem 'sunspot_rails'


# Gems for production only
group :production do
  gem "rails_12factor", "~> 0.0.2"
end

# Helps manage environment variables
gem "figaro", "~> 0.7.0"

# For debugging
group :development do
	gem 'pry'
	gem 'awesome_print'
	gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development
end

#formatting, CSS, HTML, etc.
gem "less-rails"
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'masonry-rails'
# gem "font-awesome-sass-rails", "~> 3.0.2.2"
gem 'font-awesome-less'
gem 'libv8'
# for uploading files in forms
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# enables pagination--this is used in conjunction with masonry infinite scroll
gem 'kaminari'

# lazy load images for infinite scroll
# gem 'jquery-lazy-images'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# for managing pin-images
gem "aws-sdk"

# image resizing
# gem "rmagick", "~> 2.13.2", :require => 'RMagick'

# to help with geocoding & Maps
gem "foursquare2", "~> 1.9.8"
gem 'gmaps4rails'
#gem 'geocoder'

# to help authorize with services like FourSquare and Facebook
gem "oauth2", "~> 0.9.2"

# helps create queries with != requirement
gem "squeel"

gem "acts_as_list", "~> 0.3.0"

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# for Postgres
gem "pg", "~> 0.17.1"

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

ruby "2.1.1"
