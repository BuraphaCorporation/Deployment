class AddInstructionToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :instruction, :text
  end
end
