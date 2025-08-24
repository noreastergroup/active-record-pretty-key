# frozen_string_literal: true

module ActiveRecordPrettyKey
  module Concern
    extend ActiveSupport::Concern

    included do
      before_create :generate_pretty_key
    end

    private

    def generate_pretty_key
      pk_attribute = self.class.primary_key
      return if pk_attribute.nil? || self.class.attribute_types[pk_attribute].nil? || self.class.attribute_types[pk_attribute].type != :string

      # Ensure PrettyKeyTicket is available
      return unless defined?(ActiveRecordPrettyKey::PrettyKeyTicket)

      self.assign_attributes(pk_attribute => ActiveRecordPrettyKey::PrettyKeyTicket.next_sqid) unless self.attributes[pk_attribute].present?
    end
  end
end
