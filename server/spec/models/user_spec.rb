require 'spec_helper'
require 'ruby-debug'

describe User do
  context "Test Capybara" do
    before {;visit '/'}

    it "read the welcome page" do 
      page.should have_content "Home"
    end
  end
end
