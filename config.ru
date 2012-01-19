ENV["RACK_ENV"] ||= "development"

require "bundler"
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require File.dirname(__FILE__) + "/app"
run Sinatra::Application
