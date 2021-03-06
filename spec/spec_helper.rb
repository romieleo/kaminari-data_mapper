$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(Gem.loaded_specs['kaminari'].gem_dir, 'spec'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rails'

require 'bundler/setup'
Bundler.require

# for kaminari view test
ActiveSupport.on_load :action_controller do
  prepend_view_path File.join(Gem.loaded_specs['kaminari'].gem_dir, 'spec/fake_app/views')
end

require 'capybara/rspec'
require 'database_cleaner'

require 'fake_app/rails_app'
require 'fake_app/data_mapper/config'
require 'fake_app/data_mapper/models'

require 'rspec/rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{File.join(Gem.loaded_specs['kaminari'].gem_dir, 'spec')}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rr
  config.filter_run_excluding :generator_spec => true if !ENV['GENERATOR_SPEC']
end
