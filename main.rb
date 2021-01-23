require_relative 'display.rb'
require_relative 'game.rb'
include Display

words = File.readlines('5desk.txt')

test = Game.new(words)
test.choose_word
puts test.secret_word
display_word(test.secret_word)
get_guess
