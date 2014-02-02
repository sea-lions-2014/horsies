require_relative 'spec_helper'
require File.expand_path('../../config/environment',  __FILE__)
disable :run

require 'capybara'
require 'capybara/dsl'
require File.expand_path('../../spec/helpers/authentication_helper',  __FILE__)

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include AuthenticationHelper
end

# Helpers
def selector string
  find :css, string
end