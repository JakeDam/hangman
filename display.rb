module Display 

  def display_word(word)
    len = word.length
    len.times { print "_ "}
  end

  def get_guess
    puts "Enter a letter to guess: "
    while guess = gets.chomp.downcase
      if guess !~ /^[a-z]*$/ 
        puts "Please enter only letters."
      elsif guess.length > 1
        puts "Please enter only a single letter."
      else  
        break
      end
    end
    guess
  end

end

