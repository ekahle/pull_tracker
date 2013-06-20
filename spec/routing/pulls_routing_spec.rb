require "spec_helper"

describe PullsController do
  describe "routing" do

    it "routes to #index" do
      get("/pulls").should route_to("pulls#index")
    end

    it "routes to #new" do
      get("/pulls/new").should route_to("pulls#new")
    end

    it "routes to #show" do
      get("/pulls/1").should route_to("pulls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pulls/1/edit").should route_to("pulls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pulls").should route_to("pulls#create")
    end

    it "routes to #update" do
      put("/pulls/1").should route_to("pulls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pulls/1").should route_to("pulls#destroy", :id => "1")
    end

  end
end
