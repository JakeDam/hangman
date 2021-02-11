# frozen_string_literal: true

require_relative 'display'
require_relative 'game'
require 'yaml'

def new_game
  words = File.readlines('5desk.txt')
  game = Game.new(words)
  game.choose_word
  game.play
end

def save_game(game)
  YAML.dump(game)
end

new_game
