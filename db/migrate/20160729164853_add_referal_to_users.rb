class AddReferalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referal_code, :string
    add_column :users, :referal, :integer
    add_index :users, :referal
  end
end
