# frozen_string_literal: true

# Module handles display of most game info to user
module Display
  def display_word(letters)
    letters.each { |letter| print "#{letter} " }
    print "\n"
  end

  def display_incorrect_letters(incorrect_letters)
    print "Incorrect Letters: #{display_word(incorrect_letters)}"
  end

  def get_guess
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
