puts "Creating Ideas"
25.times do
  Idea.create!(title: Faker::Hipster.sentence(4),
              body: Faker::Hipster.sentence)
            end

5.times do
Idea.create!(title: Faker::Hipster.sentence(4),
            body: Faker::Hipster.sentence(25))
          end
