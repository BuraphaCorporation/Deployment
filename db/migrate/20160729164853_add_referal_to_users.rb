class AddReferalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referal_code, :string
    add_column :users, :referrer_id, :integer
    add_index :users, :referrer_id
  end
end
