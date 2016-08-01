class AddStatusToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :status, :integer
    add_column :payments, :code, :string
    add_attachment :payments, :evidence
  end
end
