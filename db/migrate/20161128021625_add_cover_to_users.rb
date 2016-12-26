class AddCoverToUsers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :users, :cover
  end

  def down
    remove_attachment :users, :cover
  end
end
