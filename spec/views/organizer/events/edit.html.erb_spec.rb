require 'rails_helper'

RSpec.describe "organizer/events/edit", type: :view do
  before(:each) do
    @organizer_event = assign(:organizer_event, Organizer::Event.create!())
  end

  it "renders the edit organizer_event form" do
    render

    assert_select "form[action=?][method=?]", organizer_event_path(@organizer_event), "post" do
    end
  end
end
