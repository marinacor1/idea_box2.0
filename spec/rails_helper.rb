ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.around(:each, js: true) do |example|
    DatabaseCleaner.strategy = :truncation
    ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
    example.run
    ActiveRecord::Base.shared_connection = nil
  end
end
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil
  def self.connection
    @@shared_connection || retrieve_connection
  end
end

require 'capybara/rspec'

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.before(:suite) do
    if config.use_transactional_fixtures?
    end
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    if !driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

end
