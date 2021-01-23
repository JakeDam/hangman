require_relative 'display.rb'
require_relative 'game.rb'
include Display

words = File.readlines('5desk.txt')

test = Game.new(words)
test.choose_word
display_word(test.display_letters)

