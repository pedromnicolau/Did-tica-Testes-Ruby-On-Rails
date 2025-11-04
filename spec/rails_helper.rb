require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'factory_bot_rails'
require 'shoulda/matchers'
require 'webmock/rspec'            # added: load webmock for stub_request in specs
require 'capybara/rspec'           # added: load capybara for system spec configuration

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

# allow local Capybara server connections while blocking external HTTPs by default
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # Force system specs to use the :rack_test driver by default to avoid selenium/chromedriver.
  # If you need JS-enabled tests, switch the specific example to a selenium driver explicitly.
  if defined?(Capybara)
    Capybara.default_driver = :rack_test
    Capybara.javascript_driver = :rack_test
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true  # added: allow local/other requests when no cassette
end

# Configure Capybara
Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Configure system tests
RSpec.configure do |config|
  # ...existing code...

  config.before(:each, type: :system) do
    if ENV['CI']
      driven_by :headless_chrome
    else
      driven_by :selenium_chrome_headless
    end
  end
end
