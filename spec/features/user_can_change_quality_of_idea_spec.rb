require 'rails_helper'

RSpec.feature "user change quality of idea" do
  it "increase with a thumbs up", js: true do
    idea = Idea.create(title: "yolanda", body: "wassup", quality: "swill")

    visit "/"

    click_on "Thumbs Up"

    expect(page).to_not have_content "swill"
    expect(page).to have_content "plausible"
  end

  xit "decreases with a thumbs down", js: true do

  end
end
