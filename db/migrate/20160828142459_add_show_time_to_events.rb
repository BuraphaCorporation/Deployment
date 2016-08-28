class AddShowTimeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :up_time, :datetime
  end
end
