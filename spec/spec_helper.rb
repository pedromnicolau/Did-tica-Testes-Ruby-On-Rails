require 'simplecov'
require 'webdrivers'

Webdrivers::Chromedriver.required_version = '131.0.6778.85'

SimpleCov.start 'rails' do
  add_filter %w[bin config db spec vendor]
end

RSpec.configure do |config|
  # Configura o Capybara para testes de sistema
  config.before(:each, type: :system) do
    if ENV['CI'] || ENV['HEADLESS']
      driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
    else
      driven_by :selenium_chrome, screen_size: [ 1400, 1400 ]
    end
  end
end
