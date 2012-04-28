ENV["RACK_ENV"] ||= "development"

require File.join(File.dirname(__FILE__), 'config/boot')
run Bookmailist