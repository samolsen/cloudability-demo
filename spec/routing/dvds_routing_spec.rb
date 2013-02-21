require "spec_helper"

describe DvdsController do
  describe "routing" do

    it "routes to #index" do
      get("/dvds").should route_to("dvds#index")
    end

    it "routes to #new" do
      get("/dvds/new").should route_to("dvds#new")
    end

    it "routes to #show" do
      get("/dvds/1").should route_to("dvds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dvds/1/edit").should route_to("dvds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dvds").should route_to("dvds#create")
    end

    it "routes to #update" do
      put("/dvds/1").should route_to("dvds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dvds/1").should route_to("dvds#destroy", :id => "1")
    end

  end
end
