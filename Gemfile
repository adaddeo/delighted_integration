source 'https://rubygems.org'

gem 'sinatra'
gem 'tilt', '~> 1.4.1'
gem 'tilt-jbuilder', require: 'sinatra/jbuilder'

gem 'endpoint_base', github: 'spree/endpoint_base'

gem 'delighted'

group :production do
  gem 'foreman'
  gem 'unicorn'
end

group :development, :test do
  gem 'rspec'
  gem 'vcr'
end

group :test do
  gem 'pry'
  gem 'webmock'
  gem 'rack-test'
end