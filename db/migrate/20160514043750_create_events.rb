class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references  :user, index: true, foreign_key: true
      t.string      :title, unique: true
      t.text        :description
      t.text        :instruction
      t.string      :location_name
      t.string      :location_address
      t.decimal     :latitude, precision: 10, scale: 6
      t.decimal     :longitude, precision: 10, scale: 6
      t.datetime    :uptime
      t.integer     :max_price
      t.integer     :min_price

      t.timestamps null: false
    end
  end
end
