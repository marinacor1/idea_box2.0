require 'rails_helper'

RSpec.feature "user can edit idea inline" do
  it "creates and displays new idea", js: true do
    idea = Idea.create(title: "1602", body: "Marina Corona")

    visit "/"

    find("#idea-title-show").click
    find("#idea-title-show").native.send_keys("Looking for a job in NYC!")
    find("#new-ideas-header").click

    visit '/'

    expect(page).to have_content "Looking for a job in NYC!"
    expect(page).to not_have_content "1602"
  end
end
