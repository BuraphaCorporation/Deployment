require 'rails_helper'

RSpec.describe "admin/dashboards/index", type: :view do
  before(:each) do
    assign(:admin_dashboards, [
      Admin::Dashboard.create!(
        :index => "Index",
        :show => "Show"
      ),
      Admin::Dashboard.create!(
        :index => "Index",
        :show => "Show"
      )
    ])
  end

  it "renders a list of admin/dashboards" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
