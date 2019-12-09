require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_play'
require 'pry'

  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

board.start
board.player_enters_coordinates
board.board.place(cruiser, board.placement_coordinates)
