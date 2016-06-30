require 'rails_helper'

RSpec.feature "user can create a new idea" do
  it "shows newest idea on top", js: true do

    visit "/"

    fill_in "idea-title", with: "My Idea"
    fill_in "idea-body", with: "This is an idea I have"
    click_on "Save"

    expect(page).to have_content "My Idea"
    expect(page).to have_content "This is an idea I have"
  end

end
