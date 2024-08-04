require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/display'

def play_game
  game = Game.new
  game.play
  repeat_game
end

def repeat_game
  puts 'Would you like to play a new game? [y/n]'
  user_input = gets.chomp.downcase
  if user_input == 'y'
    play_game
  else
    puts 'Thanks for playing!'
  end
end

play_game
