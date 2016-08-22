class AddSortIndexToGallery < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :sort_index, :integer
  end
end
