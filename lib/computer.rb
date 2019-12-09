require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'


class Computer

  def initialize(game)
    @game = game
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
  end
end
