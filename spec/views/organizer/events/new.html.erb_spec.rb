require 'rails_helper'

RSpec.describe "organizer/events/new", type: :view do
  before(:each) do
    assign(:organizer_event, Organizer::Event.new())
  end

  it "renders new organizer_event form" do
    render

    assert_select "form[action=?][method=?]", organizer_events_path, "post" do
    end
  end
end
