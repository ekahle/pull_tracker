require "spec_helper"

describe PullManifestsController do
  describe "routing" do

    it "routes to #index" do
      get("/pull_manifests").should route_to("pull_manifests#index")
    end

    it "routes to #new" do
      get("/pull_manifests/new").should route_to("pull_manifests#new")
    end

    it "routes to #show" do
      get("/pull_manifests/1").should route_to("pull_manifests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pull_manifests/1/edit").should route_to("pull_manifests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pull_manifests").should route_to("pull_manifests#create")
    end

    it "routes to #update" do
      put("/pull_manifests/1").should route_to("pull_manifests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pull_manifests/1").should route_to("pull_manifests#destroy", :id => "1")
    end

  end
end
