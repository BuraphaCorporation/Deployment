class AddMediaToEvents < ActiveRecord::Migration[5.0]
  def up
    add_attachment :events, :cover
  end

  def down
    remove_attachment :events, :cover
  end
end
