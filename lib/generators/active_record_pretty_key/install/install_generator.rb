# frozen_string_literal: true

require "rails/generators"

module ActiveRecordPrettyKey
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      desc "Creates the tickets table migration for active_record_pretty_key"

      def create_migration
        template "create_tickets.erb", "db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_pretty_key_tickets.rb"
      end

      private

      def migration_version
        if ActiveRecord::VERSION::MAJOR >= 5
          "[#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}]"
        end
      end
    end
  end
end
