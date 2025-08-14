

module ActiveRecordPrettyKey
  class PrettyKeyTicket < ActiveRecord::Base
    @sqids = Sqids.new(
      min_length: 4,
      alphabet: Rails.application.credentials.dig(:sqids, :alphabet) || Sqids::DEFAULT_ALPHABET,
    )

    # Generate a new unique ID that works with PostgreSQL, MySQL, and SQLite
    def self.next_id
      transaction do
        # Detect database type
        adapter = connection.adapter_name.downcase

        if [ "postgresql", "postgis" ].include?(adapter)
          # PostgreSQL approach
          result = connection.execute(
            "INSERT INTO tickets (stub) VALUES ('a')
             ON CONFLICT (stub) DO UPDATE SET id = currval('tickets_id_seq')
             RETURNING id"
          )
          result[0]["id"]
        elsif [ "mysql", "mysql2" ].include?(adapter)
          # MySQL approach
          connection.execute("REPLACE INTO tickets (stub) VALUES ('a');")
          connection.execute("SELECT LAST_INSERT_ID()").first[0]
        else
          # SQLite approach (and fallback for others)
          connection.execute("REPLACE INTO tickets (stub) VALUES ('a');")
          last.id
        end
      end
    end

    def self.next_sqid
      @sqids.encode([ self.next_id ])
    end
  end
end
