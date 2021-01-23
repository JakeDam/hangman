class Game
  include Display
  attr_reader :secret_word, :guessed_letters, :incorrect_letters, :display_letters

  def initialize(words)
    @words = words
    @secret_word
    @guesses = 10
    @guessed_letters, @incorrect_letters, @display_letters = [], [], []
  end

  def choose_word
    while word = @words.sample
      if word.length > 4 && word.length < 13
        @secret_word = word.downcase.chomp.split("")
        word.length.times { @display_letters << "_" }
        break
      end
    end
  end

  def guess_letter
    while letter = get_guess
      if @guessed_letters.include?(letter)
        puts "You've already guessed that letter!"
      else  
        @guessed_letters << letter
      end
    end
  letter
  end



end

  



