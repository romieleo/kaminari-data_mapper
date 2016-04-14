$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

begin
  require 'rails'
rescue LoadError
end

require 'bundler/setup'
Bundler.require

require 'capybara/rspec'
require 'database_cleaner'

if defined? Rails
  require 'fake_app/rails_app'

  require 'rspec/rails'
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rr
  config.filter_run_excluding :generator_spec => true if !ENV['GENERATOR_SPEC']
end