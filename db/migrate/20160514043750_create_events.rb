class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name, unique: true
      t.text     :description
      t.references :user, index: true, foreign_key: true
      t.datetime :from_to
      t.string   :location
      t.decimal  :latitude, precision: 10, scale: 6
      t.decimal  :longitude, precision: 10, scale: 6

      t.string   :categories
      t.integer  :price

      t.timestamps null: false
    end
  end
end
