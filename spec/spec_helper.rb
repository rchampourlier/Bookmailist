# Load the app
require_relative '../config/boot'
#require File.dirname(__FILE__) + '/../boot'

require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Bookmailist
end