require "rails_helper"

RSpec.describe HealthResourcesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/health_resources").to route_to("health_resources#index")
    end

    it "routes to #new" do
      expect(get: "/health_resources/new").to route_to("health_resources#new")
    end

    it "routes to #show" do
      expect(get: "/health_resources/1").to route_to("health_resources#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/health_resources/1/edit").to route_to("health_resources#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/health_resources").to route_to("health_resources#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/health_resources/1").to route_to("health_resources#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/health_resources/1").to route_to("health_resources#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/health_resources/1").to route_to("health_resources#destroy", id: "1")
    end
  end
end
