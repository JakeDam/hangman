# frozen_string_literal: true

# Module handles display of most game info to user
module Display
  def display_word(letters)
    letters.each { |letter| print "#{letter} " }
    print "\n"
  end

  def print_word(secret_word)
    secret_word.each { |letter| print letter }
    print "\n"
  end

  def display_incorrect_letters(incorrect_letters, guesses)
    print 'Incorrect Letters: '
    display_word(incorrect_letters)
    print 'Incorrect Guesses Remaining: '
    puts guesses
  end

  def player_guess
    puts 'Enter a letter to guess: '
    while (guess = gets.chomp.downcase)
      if guess !~ /^[a-z]*$/
        puts 'Please enter only letters.'
      elsif guess.length > 1
        puts 'Please enter only a single letter.'
      else
        break
      end
    end
    guess
  end
end

def starting_message
  puts "Let's play Hangman!"
  puts 'Choose letters to guess the secret word and WIN'
  puts 'If you guess 10 incorrect letters, you LOSE'
  puts "Let's begin!"
  print "\n"
end

def wait
  sleep(0.5)
  print "\n"
end
