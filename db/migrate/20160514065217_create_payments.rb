class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.string :provider
      t.integer :amount
      t.integer :fee

      t.timestamps null: false
    end

    add_reference :tickets, :payment, index: true, foreign_key: true
  end
end
