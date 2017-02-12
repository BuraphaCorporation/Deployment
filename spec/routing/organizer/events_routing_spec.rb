require "rails_helper"

RSpec.describe Organizer::EventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/organizer/events").to route_to("organizer/events#index")
    end

    it "routes to #new" do
      expect(:get => "/organizer/events/new").to route_to("organizer/events#new")
    end

    it "routes to #show" do
      expect(:get => "/organizer/events/1").to route_to("organizer/events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/organizer/events/1/edit").to route_to("organizer/events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organizer/events").to route_to("organizer/events#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/organizer/events/1").to route_to("organizer/events#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/organizer/events/1").to route_to("organizer/events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organizer/events/1").to route_to("organizer/events#destroy", :id => "1")
    end

  end
end
