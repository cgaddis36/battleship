require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

  game = Game.new

game.start
game.computer_cruiser_placement
game.computer_board.render(true)
game.computer_submarine_placement
game.computer_board.render(true)
game.player_enter_squares_and_validates_them
# game.player_takes_turn
game.player_takes_turn
