require 'spec_helper'

describe "hosts/show.html.haml" do
  before(:each) do
    @host = assign(:host, stub_model(Host))
  end

  it "renders attributes in <p>" do
    render
  end
end
