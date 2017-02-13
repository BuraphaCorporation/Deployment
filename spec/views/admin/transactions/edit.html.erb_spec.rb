require 'rails_helper'

RSpec.describe "admin/transactions/edit", type: :view do
  before(:each) do
    @admin_transaction = assign(:admin_transaction, Admin::Transaction.create!())
  end

  it "renders the edit admin_transaction form" do
    render

    assert_select "form[action=?][method=?]", admin_transaction_path(@admin_transaction), "post" do
    end
  end
end
