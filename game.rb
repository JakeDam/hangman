class Game
  include Display

  def initialize(words)
    @words = words
    @secret_word
    @guesses = 10
  end

  def secret_word
    @secret_word
  end

  def choose_word
    while word = @words.sample
      if word.length > 4 && word.length < 13
        @secret_word = word.downcase.chomp
        break
      end
    end
  end

  def guess_letter
    #TO DO
  end
end

  



