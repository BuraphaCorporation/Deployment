require 'rails_helper'

RSpec.describe "admin/transactions/index", type: :view do
  before(:each) do
    assign(:admin_transactions, [
      Admin::Transaction.create!(),
      Admin::Transaction.create!()
    ])
  end

  it "renders a list of admin/transactions" do
    render
  end
end
