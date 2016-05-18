class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :users, index: true
      t.references :events, index: true

      t.string :provider
      t.integer :amount
      t.integer :fee

      t.timestamps null: false
    end
  end
end
