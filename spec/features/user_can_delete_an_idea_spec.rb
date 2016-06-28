require 'rails_helper'

RSpec.feature "user can delete an idea" do
  it "idea is no longer on index", js: true do
    idea = Idea.create(title: "1602", body: "Marina Corona")
    idea2 = Idea.create(title: "yo", body: "wassup")

    visit "/"

    within("#new-idea#{idea2.id}") do
      click_on "Delete"
    end

    expect(page).to_not have_content "yo"
    expect(page).to_not have_content "wassup"
  end
end
