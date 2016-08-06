class AddColumnSectionToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :section, index: true, foreign_key: true, after: :event_id
  end
end
