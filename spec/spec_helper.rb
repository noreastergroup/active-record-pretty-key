require "bundler/setup"
require "active_record_pretty_key"
require "active_record"
require "sqlite3"

# Set up test database
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Clean up database between tests
  config.before(:each) do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table(table)
    end
  end

  # Create the pretty_key_tickets table that PrettyKeyTicket needs
  config.before(:each) do
    ActiveRecord::Base.connection.create_table :pretty_key_tickets do |t|
      t.string :stub
    end
  end
end
