# frozen_string_literal: true

# Module handles interfacing with the user
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
      if guess == 'save'
        save_game
      elsif guess !~ /^[a-z]*$/
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

def wait
  sleep(0.5)
  print "\n"
end

def prompt_save
  begin
    filenames = Dir.entries('saved_games')
    puts 'Enter savefile name: '
    filename = gets.chomp
    raise "#{filename} already exists." if filenames.include?(filename)
  rescue StandardError
    puts "Overwrite savefile #{filename}? (Y/N)"
    input = gets.chomp.downcase
    until %w[y n].include?(input)
      puts 'Please enter Y (yes) or N (no).'
      input = gets.chomp.downcase
    end
  end
  filename
end

def prompt_load
  puts 'Enter the name of a savefile from the list below to load the game'
  filenames = Dir.entries('saved_games')
  puts filenames
  filename = gets.chomp
  raise "#{filename} not found. Please enter valid filename to load" unless filenames.include?(filename)

  puts 'Loading game...'
rescue StandardError
  retry
end
