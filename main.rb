# frozen_string_literal: true

require_relative 'display'
require_relative 'game'

def new_game
  words = File.readlines('5desk.txt')
  game = Game.new(words)
  game.choose_word
  game.play
end

new_game
