class AddQrColumnsToTickets < ActiveRecord::Migration[5.0]
  def up
    add_attachment :tickets, :qr_code
  end

  def down
    remove_attachment :tickets, :qr_code
  end
end
