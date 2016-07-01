class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.references :from_to_date, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
