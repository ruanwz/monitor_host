require "spec_helper"

describe RecordsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/records" }.should route_to(:controller => "records", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/records/new" }.should route_to(:controller => "records", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/records/1" }.should route_to(:controller => "records", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/records/1/edit" }.should route_to(:controller => "records", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/records" }.should route_to(:controller => "records", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/records/1" }.should route_to(:controller => "records", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/records/1" }.should route_to(:controller => "records", :action => "destroy", :id => "1")
    end

  end
end
