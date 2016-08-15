class AddOmiseCustomerTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :omise_customer_token, :string
  end
end
