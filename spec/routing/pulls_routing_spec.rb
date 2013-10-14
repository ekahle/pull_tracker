require "spec_helper"

describe PullsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/pulls")).to route_to("pulls#index")
    end

    it "routes to #new" do
      expect(get("/pulls/new")).to route_to("pulls#new")
    end

    it "routes to #show" do
      expect(get("/pulls/1")).to route_to("pulls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/pulls/1/edit")).to route_to("pulls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/pulls")).to route_to("pulls#create")
    end

    it "routes to #update" do
      expect(put("/pulls/1")).to route_to("pulls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/pulls/1")).to route_to("pulls#destroy", :id => "1")
    end

  end
end
