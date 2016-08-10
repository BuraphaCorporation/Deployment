class RenameColumnAvailableToSection < ActiveRecord::Migration[5.0]
  def change
    rename_column :sections, :avaliable, :available
  end
end
