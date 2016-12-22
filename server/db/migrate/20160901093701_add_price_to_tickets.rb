class AddPriceToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :price, :integer
  end
end
