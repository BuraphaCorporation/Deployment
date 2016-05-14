# class CreateEvents < ActiveRecord::Migration
#   def change
#     create_table :events do |t|
#       t.string   :name
#       t.text     :description
#       t.integer  :user_id
#       t.datetime :from_to
#       t.string   :location
#       t.decimal  :latitude, precision: 10, scale: 6
#       t.decimal  :longitude, precision: 10, scale: 6
#
#       t.string   :categories
#       t.integer  :price
#
#       t.timestamps null: false
#     end
#   end
# end
