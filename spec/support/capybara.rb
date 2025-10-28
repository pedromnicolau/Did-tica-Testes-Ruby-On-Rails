# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium/webdriver'

Capybara.register_driver :headless_chrome do |app|
  opts = Selenium::WebDriver::Chrome::Options.new
  opts.add_argument('--headless=new')
  opts.add_argument('--no-sandbox')
  opts.add_argument('--disable-gpu')
  opts.add_argument('--disable-dev-shm-usage')
  opts.add_argument('--window-size=1400,1400')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts)
end

Capybara.server = :puma, { Silent: true }
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  # 👉 Sem JS: rack_test (dispensa Chrome)
  config.before(:each, type: :system, js: false) do
    driven_by :rack_test
  end

  # 👉 Com JS: usa Chrome headless
  config.before(:each, type: :system, js: true) do
    driven_by :headless_chrome
  end
end
