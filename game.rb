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

  def check_letter(letter)
    if @secret_word.include?(letter) == true
      correct_indicies = []
      puts "Good guess!"
      @guessed_letters << letter
      @secret_word.each_with_index do |word_letter, index|
        if word_letter == letter
          correct_indicies << index
        end
      end
      correct_indicies.each { |index| @display_letters[index] == letter }
    else  
      puts "Oof, guess again!"
      @incorrect_letters << letter
    end
  end

  def check_win 
    if @display_letters.include?("_") == true
      puts "Congrats! You guessed the word!"
      #TO DO Game over method?
    end
  end



end

  



