require_relative '../lib/redis_rejson'
# require "redis_rejson"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = %i(expect should)
  end
end
