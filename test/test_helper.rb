ENV["RAILS_ENV"] = "test"

require 'simplecov'
SimpleCov.start

require File.expand_path("../../config/environment", __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'json_expressions/minitest'

# Uncomment for awesome colorful output
# require 'minitest/pride'

class ActionController::TestCase
  def sign_in
    session[:password] = 'password'
    Settings.store_password session[:password]
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def serialize(object, options = {})
    ActiveModel::SerializableResource.new(object, options).serializable_hash
  end
end
