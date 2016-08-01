class AddSlugToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :slug, :string, after: :title
    add_index :events, :slug, unique: true
    add_column :events, :name, :string, after: :title
  end
end
