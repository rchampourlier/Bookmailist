# boot.rb

# Load dependencies
require 'rubygems'
require 'bundler/setup'
Bundler.require

# Load all initializers
Dir[File.expand_path('./initializers/*.rb', __FILE__)].each { |file| require file }

# Load all models
Dir[File.expand_path('../models/*.rb', __FILE__)].each { |file| require file }

# Load app core
require_relative '../app/bookmailist'