class AddMaxMinPriceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :max_price, :integer
    add_column :events, :min_price, :integer
  end
end
