# frozen_string_literal: true

require "active_record"
require "sqids"
require_relative "active_record_pretty_key/version"
require_relative "active_record_pretty_key/pretty_key_ticket"
require_relative "active_record_pretty_key/concern"
require_relative "active_record_pretty_key/generators/install_generator"

module ActiveRecordPrettyKey
  class Error < StandardError; end
  # Your code goes here...
end
