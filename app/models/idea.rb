class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def body_truncation
    if self.body.length > 100
      letter_count
    else
      self.body
    end
  end

  def letter_count
    letters = self.body.split("")
    if letters[99] == " "
      self.body.slice!(100..-1)
      self.body
    else
      word_count_check
    end
  end

  def word_count_check
    words = self.body.split
    last_word = words.inject(0) do |sum, word|
      if sum < 100
        sum += word.length
      else
        return truncate_by_word(words, word)
      end
    end
  end

  def truncate_by_word(words, last_word)
    current_index = words.index("#{last_word}")
    deleted = words.slice!(0..current_index)
    deleted.join(" ") + "..."
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
