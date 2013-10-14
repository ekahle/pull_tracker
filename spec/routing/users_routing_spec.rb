require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to sessions#new" do
      expect(get("/users/sign_in")).to route_to("devise/sessions#new")
    end

    it "routes to sessions#create" do
      expect(post("/users/sign_in")).to route_to("devise/sessions#create")
    end

    it "routes to sessions#destroy" do
      expect(delete("/users/sign_out")).to route_to("devise/sessions#destroy")
    end

    it "routes to #index" do
      expect(get("/users")).to route_to("users#index")
    end

    it "routes to #new" do
      expect(get("/users/new")).to route_to("users#new")
    end

    it "routes to #show" do
      expect(get("/users/1")).to route_to("users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/users/1/edit")).to route_to("users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/users")).to route_to("users#create")
    end

    it "routes to #update" do
      expect(patch("/users/1")).to route_to("users#update", :id => "1")
      expect(put("/users/1")).to route_to("users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/users/1")).to route_to("users#destroy", :id => "1")
    end

  end
end
