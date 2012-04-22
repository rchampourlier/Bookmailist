source "http://rubygems.org"

gem 'sinatra', :require => "sinatra/base"
gem 'thin'

gem 'haml'
#gem 'yajl-ruby' # JSON parsing
gem 'json'

# MongoDB
gem 'mongoid'
gem 'bson_ext'
gem 'activesupport'

group :development do
  gem 'guard'
  gem 'guard-shotgun', :git => "git@github.com:rchampourlier/guard-shotgun.git", :branch => "master"
end

group :development, :test do
	gem 'rspec'
	gem 'rack-test'
end

