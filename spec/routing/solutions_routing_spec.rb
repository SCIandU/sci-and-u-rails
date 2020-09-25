require "rails_helper"

RSpec.describe SolutionCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/solution_categories").to route_to("solution_categories#index")
    end

    it "routes to #new" do
      expect(get: "/solution_categories/new").to route_to("solution_categories#new")
    end

    it "routes to #show" do
      expect(get: "/solution_categories/1").to route_to("solution_categories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/solution_categories/1/edit").to route_to("solution_categories#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/solution_categories").to route_to("solution_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/solution_categories/1").to route_to("solution_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/solution_categories/1").to route_to("solution_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/solution_categories/1").to route_to("solution_categories#destroy", id: "1")
    end
  end
end
