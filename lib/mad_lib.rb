class MadLib
  def initialize(words)
    @words = words
  end

  # return a random element from the @words array
  def get_random_word
    @words.sample
  end

  # substitue a random word for a blank ('_____') in a given phrase.
  def build_phrase(phrase)
    phrase.gsub("_____", get_random_word)
  end
end
