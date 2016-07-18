class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :event, index: true, foreign_key: true
      t.string :title
      t.integer :price
      t.datetime :from_to

      t.timestamps null: false
    end
  end
end
