class CreateFromToDates < ActiveRecord::Migration
  def change
    create_table :from_to_dates do |t|
      t.references :events, index: true
      t.datetime :from_to

      t.timestamps null: false
    end
  end
end
