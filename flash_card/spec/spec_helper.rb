require 'rubygems'
require 'rspec'
require 'rack/test'
require 'factory_girl'
Dir[File.dirname(__FILE__)+"/factories/*.rb"].each {|file| require file }
# All our specs should require 'spec_helper' (this file)

# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

# Add root project path for easy require
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# before test delete all existing models and db rows
User.delete_all
Deck.delete_all
Card.delete_all
