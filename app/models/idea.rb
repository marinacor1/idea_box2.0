class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def body_truncation(body)
    if body.length > 100
      body.slice!(100..-1)
      body
    end
  end
end
