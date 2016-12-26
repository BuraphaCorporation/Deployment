class AddTicketTypeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :ticket_type, :string
  end
end
