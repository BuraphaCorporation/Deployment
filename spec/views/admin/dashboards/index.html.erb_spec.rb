require 'rails_helper'

RSpec.describe "admin/dashboards/index", type: :view do
  before(:each) do
    assign(:admin_dashboards, [
      Admin::Dashboard.create!(),
      Admin::Dashboard.create!()
    ])
  end

  it "renders a list of admin/dashboards" do
    render
  end
end
