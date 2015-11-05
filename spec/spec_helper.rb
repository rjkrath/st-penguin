require 'rubygems'

require File.expand_path("../../config/environment", __FILE__)
Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each { |f| require f }

require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_girl'

ENV['RAILS_ENV'] = 'test'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on a real object.
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods

  # Formatted output for when running an individual spec file.
  # if config.files_to_run.one?
    # Use the documentation formatter for detailed output unless a formatter has already been configured
    # config.default_formatter = 'doc'
  # end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

=begin
  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true
=end
end
