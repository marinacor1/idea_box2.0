class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def body_truncation(body)
    if body.length > 100
      body.slice!(100..-1)
      body
    end
  end

  def increase_quality
    qualities = ["swill", "plausible", "genius"]
    current_index = qualities.index(self.quality)
    if current_index == 2
      new_quality = qualities[current_index]
    else
      new_quality = qualities[current_index + 1]
    end
  end

  def decrease_quality
    qualities = ["swill", "plausible", "genius"]
    current_index = qualities.index(self.quality)
    new_quality = qualities[current_index - 1]
  end
end
