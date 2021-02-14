# frozen_string_literal: true

require_relative 'interface'
require_relative 'game'
require 'yaml'

def new_game
  words = File.readlines('5desk.txt')
  game = Game.new(words)
  game.choose_word
  game.play
end

def save_game(game)
  filename = prompt_save
  return false unless filename

  searialized = YAML.dump(game)
  File.open("saved_games/#{filename}.yaml", 'w') { |file| file.write searialized }
end

new_game
