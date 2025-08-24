# frozen_string_literal: true

require "rails/generators"

# Register generators with Rails
Rails::Generators.configure! do |config|
  config.generators do |g|
    g.templates.unshift File.expand_path("active_record_pretty_key/generators", __dir__)
  end
end

# Load all generators
Dir[File.expand_path("active_record_pretty_key/generators/install_generator.rb", __dir__)].each do |template|
  require template
end
