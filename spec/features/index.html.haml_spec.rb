require 'spec_helper'

describe "When not signed in" do
  before :each do 
    @idea = Idea.create(name:"Hello Idea", desc:"Great idea")
  end

  it "the Idea index page should list all the ideas" do
    visit ideas_path
    expect(page).to have_content("Hello Idea")
  end

  it "the Idea index page should show all keywords in the sidebar" do
    @idea.keywords.create name:"Project", concrete:false
    Keyword.create name:"Mobile", concrete:false
    visit ideas_path
    expect(page).to have_content("Project")
    expect(page).to have_content("Mobile")
  end
end