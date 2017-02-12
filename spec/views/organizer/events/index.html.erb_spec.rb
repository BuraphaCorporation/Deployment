require 'rails_helper'

RSpec.describe "organizer/events/index", type: :view do
  before(:each) do
    assign(:organizer_events, [
      Organizer::Event.create!(),
      Organizer::Event.create!()
    ])
  end

  it "renders a list of organizer/events" do
    render
  end
end
