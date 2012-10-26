require "spec_helper"

describe SandboxesController do
  describe "routing" do

    it "routes to #index" do
      get("/sandboxes").should route_to("sandboxes#index")
    end

    it "routes to #new" do
      get("/sandboxes/new").should route_to("sandboxes#new")
    end

    it "routes to #show" do
      get("/sandboxes/1").should route_to("sandboxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sandboxes/1/edit").should route_to("sandboxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sandboxes").should route_to("sandboxes#create")
    end

    it "routes to #update" do
      put("/sandboxes/1").should route_to("sandboxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sandboxes/1").should route_to("sandboxes#destroy", :id => "1")
    end

  end
end
