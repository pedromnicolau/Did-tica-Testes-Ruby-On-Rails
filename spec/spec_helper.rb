require 'simplecov'

SimpleCov.start 'rails' do
  add_filter %w[bin config db spec vendor]
end
