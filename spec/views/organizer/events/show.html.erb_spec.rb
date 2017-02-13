require 'rails_helper'

RSpec.describe "organizer/events/show", type: :view do
  before(:each) do
    @organizer_event = assign(:organizer_event, Organizer::Event.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
