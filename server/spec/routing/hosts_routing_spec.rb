require "spec_helper"

describe HostsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/hosts" }.should route_to(:controller => "hosts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/hosts/new" }.should route_to(:controller => "hosts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/hosts/1" }.should route_to(:controller => "hosts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/hosts/1/edit" }.should route_to(:controller => "hosts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/hosts" }.should route_to(:controller => "hosts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/hosts/1" }.should route_to(:controller => "hosts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/hosts/1" }.should route_to(:controller => "hosts", :action => "destroy", :id => "1")
    end

  end
end
