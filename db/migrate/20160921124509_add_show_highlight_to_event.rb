class AddShowHighlightToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :show_highlight, :boolean, default: :false
  end
end
