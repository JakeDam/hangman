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
        word.chomp.length.times { @display_letters << "_" }
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
        break
      end
    end
  letter
  end

  def check_letter(letter)
    if @secret_word.include?(letter) == true
      correct_indicies = []
      puts "Good guess!"
      @secret_word.each_with_index do |word_letter, index|
        if word_letter == letter
          correct_indicies << index
        end
      end
      correct_indicies.map { |index| @display_letters[index] = letter }
    else  
      puts "Oof, guess again!"
      @incorrect_letters << letter
    end
  end

  def check_win 
    if @display_letters.include?("_") == false
      puts "Congrats! You guessed the word!"
      #TO DO Game over method?
    end
  end

  def play
    while @guesses > 0
      if @incorrect_letters.empty? == false
        display_incorrect_letters(@incorrect_letters)
      end
      letter = guess_letter
      check_letter(letter)
      display_word(@display_letters)
      check_win
    end
  end



 

end

  



