class AddInitialPriceToSections < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :initial_price, :integer
  end
end
