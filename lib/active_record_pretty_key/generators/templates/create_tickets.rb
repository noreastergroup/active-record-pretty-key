class CreateTickets < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :tickets, id: :bigint do |t|
      t.string :stub, limit: 1, null: false
    end
    add_index :tickets, :stub, unique: true

    # Seed initial value
    execute "INSERT INTO tickets (stub) VALUES ('a')"
  end
end
