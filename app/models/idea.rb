class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def body_truncation
    if self.body.length > 100
      letters = self.body.split("")
      if letters[99] == " "
        self.body.slice!(100..-1)
        self.body
      else
        words = self.body.split
        last_word = words.inject(0) do |sum, word|
          if sum < 100
            sum += word.length
          else
            return truncate_by_word(words, word)
          end
        end
      end
    else
      self.body
    end
  end

  def truncate_by_word(words, word)
    current_index = words.index("#{word}")
    words.slice!(current_index)
    words.join(" ")
  end

  def change_quality(data)
    qualities = ["swill", "plausible", "genius"]
    current_index = qualities.index(self.quality)
    if data == "increase"
      increase_quality(current_index)
    elsif data == "decrease"
      decrease_quality(current_index)
    else
    end
  end

  def increase_quality(current_index)
    qualities = ["swill", "plausible", "genius"]
    if current_index == 2
      new_quality = qualities[current_index]
    else
      new_quality = qualities[current_index + 1]
    end
    new_quality
  end

  def decrease_quality(current_index)
    qualities = ["swill", "plausible", "genius"]
    if current_index == 0
      new_quality = qualities[current_index]
    else
      new_quality = qualities[current_index - 1]
    end
    new_quality
  end
end
