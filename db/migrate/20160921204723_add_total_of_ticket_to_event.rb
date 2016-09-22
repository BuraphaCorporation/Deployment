class AddTotalOfTicketToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :total_of_ticket, :integer, default: 0
    add_column :events, :share_ticket, :boolean, default: false
  end
end
