class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true, foreign_key: true
      t.string   :title, unique: true
      t.text     :description
      # t.integer  :price
      # t.attachment :cover
      # t.datetime :from_to
      t.string   :location
      t.decimal  :latitude, precision: 10, scale: 6
      t.decimal  :longitude, precision: 10, scale: 6

      t.timestamps null: false
    end
  end
end
