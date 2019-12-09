require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

game = Game.new

game.start

game.player_enter_squares_and_validates_them
