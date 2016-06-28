require 'rails_helper'

RSpec.feature "visitor sees list of existing ideas" do
  it "shows list of ideas with three qualities" do
    idea = Idea.create(title: "Pitch idea", body: "Share sales.", quality: "swill")
    visit root_path

    expect(page).to have_content "Pitch idea"
    expect(page).to have_content "Share sales."
    expect(page).to have_content "swill"
  end

  it "shows ideas in descending order" do
    idea = Idea.create(title: "x", body: "y", quality: "swill")
    idea2 = Idea.create(title: "a", body: "b", quality: "plausible")

    visit root_path

    expect(page).to have_content "a"
  end
end
