require 'rails_helper'

RSpec.describe "Organizer::Events", type: :request do
  describe "GET /organizer_events" do
    it "works! (now write some real specs)" do
      get organizer_events_path
      expect(response).to have_http_status(200)
    end
  end
end
