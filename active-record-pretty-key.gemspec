# frozen_string_literal: true

require_relative "lib/active_record_pretty_key/version"

Gem::Specification.new do |spec|
  spec.name = "active-record-pretty-key"
  spec.version = ActiveRecordPrettyKey::VERSION
  spec.authors = ["Stuart Yamartino"]
  spec.email = ["stu@stuyam.com"]

  spec.summary = "A gem for generating pretty keys in ActiveRecord models"
  spec.description = "ActiveRecordPrettyKey provides functionality to generate and manage pretty, human-readable keys for ActiveRecord models."
  spec.homepage = "https://github.com/yourusername/active-record-pretty-key"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir['lib/**/*'] + ['VERSION']
  spec.bindir = "bin"
  spec.executables << "active-record-pretty-key"

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activerecord", ">= 6.0.0"
  spec.add_dependency "activesupport", ">= 6.0.0"
  spec.add_dependency "sqids", "~> 0.1"
  spec.add_dependency "thor", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at https://bundler.io/guides/creating_gem.html
end
