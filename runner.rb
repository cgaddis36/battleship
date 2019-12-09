require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

  game = Game.new

game.start

game.player_enter_squares_and_validates_them
# board.board.place(cruiser, board.placement_coordinates)
