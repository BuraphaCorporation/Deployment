class AddStageToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :stages, :string
  end
end
