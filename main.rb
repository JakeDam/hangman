# frozen_string_literal: true

require_relative 'interface'
require_relative 'game'
require 'yaml'

def starting_message
  puts "Let's play Hangman!"
  puts 'Choose letters to guess the secret word and WIN'
  puts 'If you guess 10 incorrect letters, you LOSE'
  puts 'Choose 1) to start a new game'
  puts 'Choose 2) to load an existing game'
  print "\n"
end

def new_game
  words = File.readlines('5desk.txt')
  game = Game.new(words)
  game.choose_word
  game.play
end

def save_game(game)
  filename = prompt_save
  return false unless filename

  serialized = YAML.dump(game)
  File.open("saved_games/#{filename}.yaml", 'w') { |file| file.write serialized }
end

def load_game
  filename = prompt_load
  serialized_game = File.open("saved_games/#{filename}.yaml", 'r')
  unserialized_game = YAML.safe_load(serialized_game)
  serialized_game.close
  unserialized_game
end

new_game
