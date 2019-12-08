require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require 'pry'

  board = Board.new
board.start
board.player_places_ships
