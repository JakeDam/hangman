require_relative 'display.rb'
require_relative 'game.rb'
include Display

def new_game
  words = File.readlines('5desk.txt')
  game = Game.new(words)
  game.choose_word
  p game.secret_word
  p game.display_letters
  game.play
end

new_game

