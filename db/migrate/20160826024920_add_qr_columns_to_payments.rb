class AddQrColumnsToPayments < ActiveRecord::Migration[5.0]
  def up
    add_attachment :payments, :qr_code
  end

  def down
    remove_attachment :payments, :qr_code
  end
end
