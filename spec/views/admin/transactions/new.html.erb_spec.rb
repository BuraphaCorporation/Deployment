require 'rails_helper'

RSpec.describe "admin/transactions/new", type: :view do
  before(:each) do
    assign(:admin_transaction, Admin::Transaction.new())
  end

  it "renders new admin_transaction form" do
    render

    assert_select "form[action=?][method=?]", admin_transactions_path, "post" do
    end
  end
end
