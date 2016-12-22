class AddShortDescriptionToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :short_description, :text
  end
end
