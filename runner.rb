require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

  game = Game.new

game.start
game.computer_cruiser_placement
game.player_enter_squares_and_validates_them
# board.board.place(cruiser, board.placement_coordinates)
