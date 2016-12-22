class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string      :status
      # t.string      :code
      # t.attachment  :qr_code
      t.string      :methods
      t.string      :omise_transaction_id
      t.integer     :amount
      t.integer     :fee
      t.attachment  :slip
      t.datetime    :approved_at
      t.datetime    :paid_at

      t.timestamps null: false
    end
  end
end
