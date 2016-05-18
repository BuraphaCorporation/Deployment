class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :users, index: true
      t.references :events, index: true
      t.references :from_to_dates, index: true

      t.timestamps null: false
    end
  end
end
