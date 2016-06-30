require 'rails_helper'

RSpec.feature "user can delete an idea" do
  it "idea is no longer on index", js: true do
    idea = Idea.create(title: "yolanda", body: "wassup")

    visit "/"

    within(".new-idea") do
      click_on "Delete"
    end

    expect(page).to_not have_content "yolanda"
    expect(page).to_not have_content "wassup"
  end
end
