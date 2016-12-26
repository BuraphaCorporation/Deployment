class AddFacebookOgToEvents < ActiveRecord::Migration[5.0]
  def up
    add_attachment :events, :social_share
  end

  def down
    remove_attachment :events, :social_share
  end
end
