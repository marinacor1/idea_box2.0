require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "is less than 100 characters" do
  idea = Idea.create(title: "Long idea", body: "The quokka, Setonix brachyurus), the only member of the genus Setonix, is a small macropod about the size of a domestic cat.[2] Like other marsupials in the macropod family (such as kangaroos and wallabies), the quokka is herbivorousand mainly nocturnal. Quokkas can be found on some smaller islands off the coast of Western Australia, in particular onRottnest Island just off Perth and Bald Island near Albany. A small mainland colony exists in the protected area of Two Peoples Bay Nature Reserve, where they co-exist with Gilbert's potoroo.")

  expect(idea.body.count).to eq(100)
  expect(idea.body.split.last).to eq("the")
  end
end
