class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.string      :invoice_no, unique: :true
      t.string      :status
      t.string      :code
      t.attachment  :qr_code

      t.timestamps
    end

    add_reference :tickets, :order, index: true, foreign_key: true
    add_reference :payments, :order, index: true, foreign_key: true

    # create_join_table :orders, :payments do |t|
    #   t.index [:order_id, :payment_id]
    #   t.index [:payment_id, :order_id]
    # end
  end
end
