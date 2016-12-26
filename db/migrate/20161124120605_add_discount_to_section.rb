class AddDiscountToSection < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :discount, :integer, default: 0
  end
end
