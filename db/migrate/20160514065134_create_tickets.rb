class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :status, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :code

      t.timestamps null: false
    end
  end
end
