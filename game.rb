class Game
  def initialize(words)
    @words = words
    @secret_word
  end

  def secret_word
    @secret_word
  end

  def choose_word
    while word = @words.sample
      if word.length > 4 && word.length < 13
        @secret_word = word.downcase
        break
      end
    end
  end
end

  



