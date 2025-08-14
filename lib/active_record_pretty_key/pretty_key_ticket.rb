

module ActiveRecordPrettyKey
  class PrettyKeyTicket < ActiveRecord::Base
    self.table_name = "tickets"

    @sqids = Sqids.new(
      min_length: 4,
      alphabet: Sqids::DEFAULT_ALPHABET,
    )

    # Generate a new unique ID using ActiveRecord methods
    def self.next_id
      transaction do
        ticket = create!(stub: 'a')
        ticket.id
      end
    end

    def self.next_sqid
      @sqids.encode([ self.next_id ])
    end
  end
end
