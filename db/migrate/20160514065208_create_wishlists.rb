class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :events, index: true
      t.references :users, index: true

      t.timestamps null: false
    end
  end
end
