# frozen_string_literal: true

# Game class houses all main game functionality
class Game
  include Display
  attr_reader :secret_word, :guessed_letters, :incorrect_letters, :display_letters

  def initialize(words)
    @words = words
    @guesses = 10
    @guessed_letters = []
    @incorrect_letters = []
    @display_letters = []
  end

  def choose_word
    while (word = @words.sample)
      next unless word.length > 4 && word.length < 13

      @secret_word = word.downcase.chomp.split('')
      word.chomp.length.times { @display_letters << '_' }
      break
    end
  end

  def guess_letter
    while (letter = get_guess)
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
    if @secret_word.include?(letter)
      correct_indicies = []
      puts 'Good guess!'
      @secret_word.each_with_index do |word_letter, index|
        correct_indicies << index if word_letter == letter
      end
      correct_indicies.map { |index| @display_letters[index] = letter }
    else
      puts 'Oof, guess again!'
      @incorrect_letters << letter
    end
  end

  def quit_game
    puts 'Thanks for playing!'
    exit
  end

  def game_over
    while (input = gets.chomp.downcase)
      case input
      when 'y'
        new_game
      when 'n'
        quit_game
      else
        puts 'Please enter Y or N'
      end
    end
  end

  def check_win
    return unless @display_letters.include?('_') == false

    puts 'Congrats! You guessed the word!'
    puts 'Play again? (Y/N)'
    game_over
  end

  def play
    while @guesses.positive?
      display_incorrect_letters(@incorrect_letters) if @incorrect_letters.empty? == false
      letter = guess_letter
      check_letter(letter)
      display_word(@display_letters)
      check_win
    end
  end
end
