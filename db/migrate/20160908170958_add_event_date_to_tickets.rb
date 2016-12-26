class AddEventDateToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :event_date, :datetime
  end
end
