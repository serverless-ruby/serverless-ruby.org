source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.0.3'
gem 'mimemagic', github: 'serverless-ruby/mimemagic', ref: '3543363026121ee28d98dfce4cb6366980c055ee'

gem 'dotenv-rails', require: true
gem 'lamby', require: false

# dynamo DB
gem 'dynamoid', require: false

# Redis caching
gem 'redis'
gem 'hiredis'

# FE stuff
gem 'webpacker'

# be logic gems
gem 'omniauth', require: false
gem 'omniauth-github', require: false
gem 'dude_policy'
gem 'kramdown'
gem 'opengraph_parser'


group :assets do
  gem 'sass-rails'
end

group :development do
  gem 'web-console'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'lograge'
end
