class AddWhythisToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :whythis, :text
  end
end
