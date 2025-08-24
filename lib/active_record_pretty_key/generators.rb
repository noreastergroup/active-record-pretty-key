# frozen_string_literal: true

require "rails/generators"

# Load all generators
require_relative "active_record_pretty_key/generators/install_generator"

# Register generators with Rails
if defined?(Rails)
  Rails::Generators.configure! do |config|
    config.generators do |g|
      g.templates.unshift File.expand_path("active_record_pretty_key/generators", __dir__)
    end
  end
end
