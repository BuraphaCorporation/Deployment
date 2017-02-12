require 'rails_helper'

RSpec.describe "admin/dashboards/new", type: :view do
  before(:each) do
    assign(:admin_dashboard, Admin::Dashboard.new())
  end

  it "renders new admin_dashboard form" do
    render

    assert_select "form[action=?][method=?]", admin_dashboards_path, "post" do
    end
  end
end
