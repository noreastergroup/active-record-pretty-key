# frozen_string_literal: true

require_relative "lib/active_record_pretty_key/version"

Gem::Specification.new do |spec|
  spec.name = "active-record-pretty-key"
  spec.version = ActiveRecordPrettyKey::VERSION
  spec.authors = ["Your Name"]
  spec.email = ["your.email@example.com"]

  spec.summary = "A gem for generating pretty keys in ActiveRecord models"
  spec.description = "ActiveRecordPrettyKey provides functionality to generate and manage pretty, human-readable keys for ActiveRecord models."
  spec.homepage = "https://github.com/yourusername/active-record-pretty-key"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

    # Uncomment to register a new dependency of your gem
  spec.add_dependency "activerecord", ">= 6.0.0"
  spec.add_dependency "sqids", "~> 0.1"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
