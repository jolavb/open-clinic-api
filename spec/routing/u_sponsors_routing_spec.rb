require "rails_helper"

RSpec.describe USponsorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/u_sponsors").to route_to("u_sponsors#index")
    end


    it "routes to #show" do
      expect(:get => "/u_sponsors/1").to route_to("u_sponsors#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/u_sponsors").to route_to("u_sponsors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/u_sponsors/1").to route_to("u_sponsors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/u_sponsors/1").to route_to("u_sponsors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/u_sponsors/1").to route_to("u_sponsors#destroy", :id => "1")
    end

  end
end
