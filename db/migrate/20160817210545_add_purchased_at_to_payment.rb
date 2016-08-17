class AddPurchasedAtToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :purchased_at, :datetime
  end
end
