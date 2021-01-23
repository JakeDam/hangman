require_relative 'game.rb'
require_relative 'display.rb'

words = File.readlines('5desk.txt')

test = Game.new(words)
test.choose_word
puts test.secret_word

