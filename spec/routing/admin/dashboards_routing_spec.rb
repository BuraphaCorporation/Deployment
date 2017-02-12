require "rails_helper"

RSpec.describe Admin::DashboardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/dashboards").to route_to("admin/dashboards#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/dashboards/new").to route_to("admin/dashboards#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/dashboards/1").to route_to("admin/dashboards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/dashboards/1/edit").to route_to("admin/dashboards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/dashboards").to route_to("admin/dashboards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/dashboards/1").to route_to("admin/dashboards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/dashboards/1").to route_to("admin/dashboards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/dashboards/1").to route_to("admin/dashboards#destroy", :id => "1")
    end

  end
end
