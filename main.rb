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
end

def load_game
  filename = prompt_load
  serialized_game = File.open("saved_games/#{filename}.yaml", 'r')
  unserialized_game = YAML.safe_load(serialized_game)
  serialized_game.close
  unserialized_game
end

def player_game_choice
  choice = gets.chomp
  until %w[1 2].include?(choice)
    puts 'Please enter 1 (start new game) or 2 (load saved game)'
    choice = gets.chomp
  end
  choice
end

def new_game
  starting_message
  words = File.readlines('5desk.txt')
  choice = player_game_choice
  if choice == '1'
    game = Game.new(words)
    game.choose_word
    game.play
  else
    load_game
  end
end

new_game
