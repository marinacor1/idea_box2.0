require 'rails_helper'

RSpec.feature "visitor sees list of existing ideas" do
  it "shows list of ideas with three qualities" do
    idea = Idea.create(title: "Pitch idea", body: "Share sales.", quality: "swill")
    visit root_path
binding.pry
    expect(page).to have_content "Pitch idea"
    expect(page).to have_content "Share sales."
    expect(page).to have_content "swill"
  end
end
