require "spec_helper"

describe PullListsController do
  describe "routing" do

    it "routes to #index" do
      get("/pull_lists").should route_to("pull_lists#index")
    end

    it "routes to #new" do
      get("/pull_lists/new").should route_to("pull_lists#new")
    end

    it "routes to #show" do
      get("/pull_lists/1").should route_to("pull_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pull_lists/1/edit").should route_to("pull_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pull_lists").should route_to("pull_lists#create")
    end

    it "routes to #update" do
      put("/pull_lists/1").should route_to("pull_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pull_lists/1").should route_to("pull_lists#destroy", :id => "1")
    end

  end
end
