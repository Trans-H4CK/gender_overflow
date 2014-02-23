# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

TEST_PASSWORD = 'password'

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.include Devise::TestHelpers, :type => :view
  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :helper
  config.include AuthorizationHelpers, :type => :controller

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false
  truncation_types = [:feature, :task]

  DatabaseCleaner.strategy = :transaction

  config.before :suite do
    File::open("log/test.log", "w") do |log|
      log.write ""
    end
  end

  config.before :all, :type => proc{ |value| truncation_types.include?(value)} do
    Rails.application.config.action_dispatch.show_exceptions = true
    DatabaseCleaner.clean_with :truncation, {:except => %w[spatial_ref_sys]}
    load 'db/seeds.rb'
  end

  config.after :all, :type => proc{ |value| truncation_types.include?(value)} do
    DatabaseCleaner.clean_with :truncation, {:except => %w[spatial_ref_sys]}
    load 'db/seeds.rb'
  end

  config.before :all, :type => :task do
    DatabaseCleaner.clean_with :truncation, {:except => %w[spatial_ref_sys]}
  end

  config.after :all, :type => :task do
    DatabaseCleaner.clean_with :truncation, {:except => %w[spatial_ref_sys]}
  end

  config.before :each, :type => proc{ |value| not truncation_types.include?(value)} do
    DatabaseCleaner.start
  end

  config.after :each, :type => proc{ |value| not truncation_types.include?(value)} do
    DatabaseCleaner.clean
  end

  config.before :suite do
    DatabaseCleaner.clean_with :truncation, {:except => %w[spatial_ref_sys]}
    load 'db/seeds.rb'
  end

end
