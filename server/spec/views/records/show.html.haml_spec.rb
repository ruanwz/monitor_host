require 'spec_helper'

describe "records/show.html.haml" do
  before(:each) do
    @record = assign(:record, stub_model(Record))
  end

  it "renders attributes in <p>" do
    render
  end
end
