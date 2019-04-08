require "rails_helper"

RSpec.describe FlrsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/flrs").to route_to("flrs#index")
    end

    it "routes to #new" do
      expect(:get => "/flrs/new").to route_to("flrs#new")
    end

    it "routes to #show" do
      expect(:get => "/flrs/1").to route_to("flrs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/flrs/1/edit").to route_to("flrs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/flrs").to route_to("flrs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/flrs/1").to route_to("flrs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/flrs/1").to route_to("flrs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/flrs/1").to route_to("flrs#destroy", :id => "1")
    end
  end
end
