require 'coveralls'
Coveralls.wear!('rails')
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:dbc] = OmniAuth::AuthHash.new({
    :provider => 'dbc',
    :info => {
      :name => "John Doe",
      :id => '12345',
      :email => "hello@example.com"
    }
  })
