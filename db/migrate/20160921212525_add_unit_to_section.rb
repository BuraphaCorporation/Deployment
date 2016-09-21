class AddUnitToSection < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :unit, :integer, default: 1
  end
end
