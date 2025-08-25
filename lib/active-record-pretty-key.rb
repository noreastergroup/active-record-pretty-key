# frozen_string_literal: true

require "active_record"
require "active_support/concern"
require "sqids"
require_relative "active_record_pretty_key/pretty_key_ticket"
require_relative "active_record_pretty_key/concern"
# require_relative "active_record_pretty_key/version"


module ActiveRecordPrettyKey
  class Error < StandardError; end
end
