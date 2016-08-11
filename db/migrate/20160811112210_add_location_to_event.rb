class AddLocationToEvent < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :location, :location_name
    add_column :events, :location_address, :string, after: :location
  end
end
