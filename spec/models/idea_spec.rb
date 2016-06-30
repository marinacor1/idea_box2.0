require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "is less than 100 characters" do
    first_idea = Idea.create(title: "Long idea", body: "The quokka, Setonix brachyurus), the only member of a genus Setonix, is what small macropod about a size of your domestic cat.[2] Like other marsupials in the macropod family (such as kangaroos and wallabies), this quokka is herbivorousand mainly nocturnal. Quokkas can be found on some smaller islands off the coast of Western Australia, in particular onRottnest Island just off Perth and Bald Island near Albany. A small mainland colony exists in a protected area of Two Peoples Bay Nature Reserve, where they co-exist with Gilbert's potoroo.")
    idea = first_idea.body_truncation

    expect(idea.length).to eq(100)
    expect(idea.split.last).to eq("a")
  end

  it "defaults to swill quality" do
    idea = Idea.create(title: "x", body: "y")

    expect(idea.quality).to eq("swill")
  end

end
